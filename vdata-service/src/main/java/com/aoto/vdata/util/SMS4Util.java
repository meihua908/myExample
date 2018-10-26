package com.aoto.vdata.util;

import java.io.UnsupportedEncodingException;

/** 
 * @author liuy08
 * @date 2018-05-21 上午10:10:00 
 *  
 */

/*Created By lick01 SMS4加密算法 20150908
 * edit by lick01 20151225
 * 默认密钥加密SMS4EncodeStr（String）
 * 默认密钥解密SMS3DeCodeStr(String)
 * 调用加密SMS4EncodeStr(String,String);
 * 调用解密SMS4DecodeStr(String ,String)
 * 密钥的长度同上
 * 
 *系统必须支持UTF-8
 * 
 * 
 * */
public class SMS4Util {
	
	public static void main(String arg[])
	{		
		String mes="";
		String key ="123456";

		String enCode="";
		try {
			enCode = SMS4EncodeStr(mes);
		} catch (UnsupportedEncodingException e) {
			System.out.println("系统不支持此编码格式"+Constant.CHARSET);
			e.printStackTrace();
		}
		System.out.println("完整的加密结果为："+enCode);
		String deCode="";
		try {
			deCode = SMS4DecodeStr(enCode);
		} catch (UnsupportedEncodingException e) {
			System.out.println("系统不支持此编码格式"+Constant.CHARSET);
			e.printStackTrace();
		}
		System.out.println("完整的解密结果为："+deCode);
		
		if(mes.equals(deCode))
		{
			System.out.println("解密成功");
		}
		

        
	}
	
	
	
	//无密钥加密调用（默认密码加密）
	public static String SMS4EncodeStr(String source) throws UnsupportedEncodingException
	{
		String result = SMS4EncodeStr(source,"1234567890123");
		
		return result;
	}
	
	//无密钥解密调用（默认密码解密）
	public static String SMS4DecodeStr(String encode) throws UnsupportedEncodingException
	{
       String result = SMS4DecodeStr(encode,"1234567890123");
		
		return result;
	}
	
	//大于分组的加密
	public static String SMS4EncodeStr(String source,String key) throws UnsupportedEncodingException{
		SMS4Util sms4 = new SMS4Util();
		
		//将文字转变为字节流
		byte[] oriKey = source.getBytes(Constant.CHARSET);
		
		if(oriKey.length<=Constant.KEY_BYTE_LENGTH/8){
			String res =sms4.SMS4Encode(source, key);
			return res;
		}
		
		StringBuffer sb = new StringBuffer();
		
		if(oriKey.length>Constant.KEY_BYTE_LENGTH/8){
			//可以分组
			int rows= oriKey.length/(Constant.KEY_BYTE_LENGTH/8);
			byte[]  byteIn=new byte[Constant.KEY_BYTE_LENGTH/8];
			for(int i=0;i<rows;i++){
				System.arraycopy(oriKey, i*(Constant.KEY_BYTE_LENGTH/8), byteIn, 0, Constant.KEY_BYTE_LENGTH/8);
				
				String temStr = sms4.SMS4Encode(byteIn,key);
				
				sb.append(temStr);		
			}
			
			if(oriKey.length%(Constant.KEY_BYTE_LENGTH/8)!=0){
				int last=oriKey.length%(Constant.KEY_BYTE_LENGTH/8);
				byte[] lastByte=new byte[last];
				
				System.arraycopy(oriKey, rows*(Constant.KEY_BYTE_LENGTH/8), lastByte, 0, last);
                String temStr = sms4.SMS4Encode(lastByte,key);
				
				sb.append(temStr);
			}
		}
		String result =sb.toString();
		
		return result;
		
	}
	
	public static String SMS4DecodeStr(String encode,String key) throws UnsupportedEncodingException{
		SMS4Util sms4 = new SMS4Util();
		
		int strLength = encode.length();
		int rows =strLength/(Constant.KEY_BYTE_LENGTH/4);
		if(rows==1){
			String result=SMS4Decode(encode,key);
			return result;
		}
		
		byte[] allBytes = new byte[(Constant.KEY_BYTE_LENGTH/8)*(rows)];
		
		String temStr;
		int allByteLength=0;
		if(strLength%(Constant.KEY_BYTE_LENGTH/4)==0){
			for(int i=0;i<rows;i++){
				temStr=encode.substring(i*(Constant.KEY_BYTE_LENGTH/4), (i+1)*(Constant.KEY_BYTE_LENGTH/4));
				
				byte[] temRes= sms4.SMS4DecodeByte(temStr, key);
				System.arraycopy(temRes, 0, allBytes,i*(Constant.KEY_BYTE_LENGTH/8),temRes.length);
				allByteLength=allByteLength+temRes.length;
			}	
			
		}
		
		byte[] allMessageByte = new byte[allByteLength];
		System.arraycopy(allBytes, 0, allMessageByte, 0, allByteLength);
		
		String res = new String(allMessageByte,Constant.CHARSET);
		
		return res;
		
	}
	
	//加密调用
	private String SMS4Encode(String source,String key) throws UnsupportedEncodingException
	{
		SMS4Util sms4 = new SMS4Util();
		//获取输入文字字节流
		byte[] oriByte =sms4.sourceToByte(source);
		
		//获取密钥字节流
		byte[] oriKey = key.getBytes();
		
		//获取扩增后密钥流
		int[] keyExpand =sms4.keyExpand(oriKey);
		
		//加密流结果
		int[] enRes = sms4.RoundEncode(oriByte,keyExpand);
		
		//输出
		String resStr = sms4.EncodeToStr(enRes);
		return resStr;
	}
	//解密调用
	private static String SMS4Decode(String encode,String key) throws UnsupportedEncodingException
	{

		SMS4Util sms4 = new SMS4Util();
		
		//获取密文字节流
		byte[] deByte = HexStringToBytes(encode);
		

		//获取密钥字节流
		byte[] oriKey = key.getBytes();

		
		//获取扩增后密钥流
		int[] keyExpand =sms4.keyExpand(oriKey);
		
		//解密结果流
		int[] deRes = sms4.RoundDecode(deByte,keyExpand);
		//输出
		String resStr = sms4.DecodeToStr(deRes);
		
		return resStr;
		
	}
	
	private String SMS4Encode(byte[] byteIn,String key)
	{
		SMS4Util sms4 = new SMS4Util();
		//获取输入文字字节流
		byte[] oriByte =byteExpand(byteIn);;
		
		//获取密钥字节流
		byte[] oriKey = key.getBytes();
		
		//获取扩增后密钥流
		int[] keyExpand =sms4.keyExpand(oriKey);
		
		//加密流结果
		int[] enRes = sms4.RoundEncode(oriByte,keyExpand);
		
		//输出
		String resStr = sms4.EncodeToStr(enRes);
		return resStr;
	}
	
	//解密调用
	private byte[] SMS4DecodeByte(String encode,String key)
	{

		SMS4Util sms4 = new SMS4Util();
		
		//获取密文字节流
		byte[] deByte = HexStringToBytes(encode);
		

		//获取密钥字节流
		byte[] oriKey = key.getBytes();

		
		//获取扩增后密钥流
		int[] keyExpand =sms4.keyExpand(oriKey);
		
		//解密结果流
		int[] deRes = sms4.RoundDecode(deByte,keyExpand);
		//输出
		byte[] temByte= sms4.getDeByte(deRes);
		
		return temByte;
		
	}
	
	
	private byte[] byteExpand(byte[] byteIn){
		
	    
		if(byteIn.length<Constant.KEY_BYTE_LENGTH/8){
			byte[] temByte=new byte[Constant.KEY_BYTE_LENGTH/8];
			System.arraycopy(byteIn, 0, temByte,0,byteIn.length);
			
			for(int i=byteIn.length;i<Constant.KEY_BYTE_LENGTH/8;i++){
				temByte[i]=0x00;
			}
			
			return temByte;
			
		}else{
			return byteIn;
		}
	}
	//将输入的原明文转换成字节
	private byte[] sourceToByte(String source) throws UnsupportedEncodingException
	{
		byte[] oriByte = source.getBytes(Constant.CHARSET);
        byte[] resKey = new byte[Constant.KEY_BYTE_LENGTH/8];
		
		
		for(int i=0;i<Constant.KEY_BYTE_LENGTH/8;i++)
		{
			if(i<oriByte.length)   //密钥长度不满，需补充长度
			{
				resKey[i] =oriByte[i];
			}
			else
			{
				resKey[i]=0x00;   //缺值补充位置
			}
		}
		
		return resKey;
	}
	
	//将加密后字符流转成字符串
	private  String EncodeToStr(int[] res)
	{
		String outRes= bytesToHexString(intToBytes2(res[3]))
		              +bytesToHexString(intToBytes2(res[2]))+bytesToHexString(intToBytes2(res[1]))+
		              bytesToHexString(intToBytes2(res[0]));
		
		return outRes;
	}
	
	private byte[] getDeByte(int[] res){
		byte[] resByte = new byte[Constant.KEY_BYTE_LENGTH/8];
		for(int i=0;i<res.length;i++)
		{
			resByte[i*4] = (byte)(res[res.length-i-1]>>>24);
			resByte[i*4+1] = (byte)((res[res.length-i-1]<<8)>>>24);
			resByte[i*4+2] = (byte)((res[res.length-i-1]<<16)>>>24);
			resByte[i*4+3] = (byte)((res[res.length-i-1]<<24)>>>24);
		}
		
		int mesLength =resByte.length;
		for(int j=0;j<resByte.length;j++)
		{
			if(resByte[j]==(byte)0x00)
			{
				mesLength=j;
				break;
			}
		}
		byte[] mesByte =new byte[mesLength];
		for(int j=0;j<mesLength;j++)
		{
			mesByte[j] = resByte[j];
		}
		return  mesByte;
	}
	//将解密后字符流转成字符串
	private  String DecodeToStr(int[] res) throws UnsupportedEncodingException
	{
		byte[] resByte = new byte[Constant.KEY_BYTE_LENGTH/8];
		for(int i=0;i<res.length;i++)
		{
			resByte[i*4] = (byte)(res[res.length-i-1]>>>24);
			resByte[i*4+1] = (byte)((res[res.length-i-1]<<8)>>>24);
			resByte[i*4+2] = (byte)((res[res.length-i-1]<<16)>>>24);
			resByte[i*4+3] = (byte)((res[res.length-i-1]<<24)>>>24);
		}
		
		int mesLength =resByte.length;
		for(int j=0;j<resByte.length;j++)
		{
			if(resByte[j]==(byte)0x00)
			{
				mesLength=j;
				break;
			}
		}
		
		byte[] mesByte =new byte[mesLength];
		for(int j=0;j<mesLength;j++)
		{
			mesByte[j] = resByte[j];
		}
		
		String reStr = null;  //GWT不支持默认字符建立String
		
		reStr = new String (mesByte,Constant.CHARSET);
		
		
		return  reStr;
	}
	
	//加密轮运算
	private int[] RoundEncode(byte[] oriByte,int[] expandKey)
	{
		int[] temK= new int[4];  
		for(int i=0;i<4;i++)
	    {
			temK[i]= ((oriByte[i*4])<<24)|(((oriByte[i*4+1])<<24)>>>8)|(((oriByte[i*4+2])<<24)>>>16)|((oriByte[i*4+3])<<24)>>>24;
	    }
		
		for(int i=0;i<Constant.ROUND;i++)
		{
			temK[(i+4)%4] = CalF(temK[i%4],temK[(i+1)%4],temK[(i+2)%4],temK[(i+3)%4],expandKey[i+4]);
			//System.out.print("第"+i+"次的加密结果为");   //此处输出加密直接位结果
			//showNum(temK[(i+4)%4]);
		}
		
		return temK;
	}
	
	//解密轮算法
	private int[] RoundDecode(byte[] oriByte,int[] expandKey)
	{
		int[] temK= new int[4];  
		for(int i=0;i<4;i++)
	    {
			temK[i]= ((oriByte[i*4])<<24)|(((oriByte[i*4+1])<<24)>>>8)|(((oriByte[i*4+2])<<24)>>>16)|((oriByte[i*4+3])<<24)>>>24;
	    }
		
		for(int i=0;i<Constant.ROUND;i++)
		{
			temK[(i+4)%4] = CalF(temK[i%4],temK[(i+1)%4],temK[(i+2)%4],temK[(i+3)%4],expandKey[Constant.ROUND+3-i]);
			//System.out.print("第"+i+"次的解密结果为");        //测试输出结果
			//showNum(temK[(i+4)%4]);
		}
		
		return temK;
	}
	
	private int CalF(int X0,int X1,int X2,int X3,int key)
	{
		int result = 0x00000000;
		
		result = X0^ComposeT(X1^X2^X3^key);
		return result;
	}
	
	//计算加解密用的T变换
	private int ComposeT(int oriK)
	{
		int temK = SBoxChange(oriK);
		temK =temK^moveRound(temK,2)^moveRound(temK,10)^moveRound(temK,18)^moveRound(temK,24);
		return  temK;
	}
	
	//密钥扩展函数
	private int[] keyExpand(byte[] byteKey)
	{
		byte[] resKey = new byte[Constant.KEY_BYTE_LENGTH/8];
		
		
		for(int i=0;i<Constant.KEY_BYTE_LENGTH/8;i++)
		{
			if(i<byteKey.length)   //密钥长度不满，需补充长度
			{
				resKey[i] =byteKey[i];
			}
			else
			{
				resKey[i]=0x00;   //缺值补充位置
			}
		}
	    int[] calK = new int[Constant.KEY_BYTE_LENGTH/4+4];   //保存每轮计算的K值，下标4~35为轮密钥
	    OrginalK(resKey,calK);
	    CalKey(calK);
		return calK;
	}
	
	//密钥扩展，首先获得首轮密钥
	private void OrginalK(byte[] byteKey,int[] calK)
	{
		int[] temK= new int[4];
	    for(int i=0;i<4;i++)
	    {
	    	temK[i]= ((byteKey[i*4])<<24)|(((byteKey[i*4+1])<<24)>>>8)|(((byteKey[i*4+2])<<24)>>>16)|((byteKey[i*4+3])<<24)>>>24;
	    	calK[i] = temK[i]^Constant.SYSTEM_KEY[i];
	    }
		
	}
	//计算剩下32轮密钥
	private void CalKey(int[] calK)
	{
		for(int i=0;i<Constant.ROUND;i++)
		{
			calK[i+4] = calK[i]^ComposeKey(calK[i+1]^calK[i+2]^calK[i+3]^Constant.CON_KEY[i]);
		}
	}
	//计算密钥用的T变换
	private int ComposeKey(int oriK)
	{
		int temK = SBoxChange(oriK);
		temK =temK^moveRound(temK,13)^moveRound(temK,23);
		return  temK;
	}
	
	//循环变换
	private int moveRound(int oldVar,int step)
	{
		return (oldVar<<step)|(oldVar>>>32-step);
	}
	
	
	//S盒变换，用于密钥扩展和轮加密
	private int SBoxChange(int oriK)
	{

		int temK=0;
		//获取该字的4个值
		int[] temRow = new int[4];
		temRow[0] = Constant.SBOX[(oriK>>>28)*16+( (oriK<<4) >>>28)];
		temRow[1] = Constant.SBOX[( (oriK<<8) >>>28)*16+((oriK<<12)>>>28)];
		temRow[2] = Constant.SBOX[((oriK<<16) >>>28)*16+((oriK<<20)>>>28)];
		temRow[3] = Constant.SBOX[((oriK<<24) >>>28)*16+((oriK<<28)>>>28)];
		
		temK = (temRow[0]<<24)|(temRow[1]<<16)|(temRow[2]<<8)|temRow[3];
		return temK;
	}
	
	//测试输出用
	@SuppressWarnings("unused")
	private  static void showNum(int bs)
	{
		System.out.print("单个结果为：");
		
		
	    System.out.print(""+bytesToHexString(intToBytes2(bs))+"\t");
		
		
		System.out.println();
	}
	//测试输出用
	@SuppressWarnings("unused")
	private  static void showNum(int[] bs)
	{
		System.out.print("结果为：");
		for(int i=0;i<bs.length;i++)
		{
			System.out.print(""+bytesToHexString(intToBytes2(bs[i]))+"\t");
		}
		
		System.out.println();
	}
	
	// 字节数组转16进制字符串
	private static String bytesToHexString(byte[] bytes)
	{
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
		char[] temp = new char[bytes.length * 2];
		for (int i = 0; i < bytes.length; i++)
		{
			byte b = bytes[i];
			temp[i * 2] = hexDigits[b >>> 4 & 0x0f];
			temp[i * 2 + 1] = hexDigits[b & 0x0f];
		}
		return new String(temp);
	}
	
	// 16进制字符串转字节数组
	private static byte[] HexStringToBytes(String allRes)
	{
		if(allRes==null||allRes.equals(""))  //防止解密输入值为空值
		{
			allRes="00000000000000000000000000000000";
		}
		char[] temp = allRes.toCharArray();
		byte[] resByte = new byte[temp.length/2];
		
		if(resByte.length==Constant.KEY_BYTE_LENGTH/8)
			{
			int temInt =0x00;
			for (int i = 0; i < temp.length; i++)
			{
			     if(i%2==0)
			     {
			    	 temInt = (findPosition(temp[i])<<4)|((findPosition(temp[i+1])<<4)>>>4);
			    	 resByte[i/2] =(byte)temInt;
			     }
			     
			}
		}
		else   //当密文不满足解密位数时返回全零密文
		{
			String errorCode="00000000000000000000000000000000";
			resByte =errorCode.getBytes();
		}
		return resByte;
	}
	
	private static int findPosition(char hexChar)
	{
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
		int position =0;
	     for(int pos=0;pos<hexDigits.length;pos++)
	     {
	    	 if(hexChar==hexDigits[pos])
	    	 {
	    		 position = pos;
	    		 break;
	    	 }
	     }
	     
	     return position;
	}
	
	//将整形转化为字节
	private static byte[] intToBytes2(int value)   
	{   
	    byte[] src = new byte[4];  
	    src[0] = (byte) ((value>>24) & 0xFF);  
	    src[1] = (byte) ((value>>16)& 0xFF);  
	    src[2] = (byte) ((value>>8)&0xFF);    
	    src[3] = (byte) (value & 0xFF);       
	    return src;  
	}  


}


