$(function() {
	var x = (window.innerWidth-150)/1730;
	var y =(window.innerHeight-100)/851;
	show(x,y);
	window.onresize = function(){
		var x = (window.innerWidth-150)/1730;
		var y =(window.innerHeight-100)/851;
		show(x,y);
	}
});
function show(x,y) {
  $("#main1").datagrid({
    showHeader: false,
    title: "算法库",
    width: 261*x,
    height: 720*y,
    fitColumns: false,
    autoRowHeight:false,
    columns: [
      [
        {
          field: "algorithm",
          width: "258*x",
          title: "算法库",
          align: "center"
        }
      ]
    ],
    data: [
      {
        algorithm: "随机森林"
      },
      {
        algorithm: "线性回归"
      },
      {
        algorithm: "决策树"
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      },
      {
        algorithm: ""
      }
    ],
    idField: "id",
    loadMsg: "Loading, please waiting",
    pagination: false,
    singleSelect:true,
    rowStyler: function(index, row) {
      return "background-color: white; text-color: black; height : 61*y+'px';";
    },
    onLoadSuccess: function(data) {
      var panel = $(this).datagrid("getPanel");
      var tr = panel.find("div.datagrid-body tr");
      tr.each(function() {
        var td = $(this).children("td");
        td.css({
          "border-width": "0"
        });
      });
    }
  });

  $("#main2").datagrid({
    title: "模型列表",
    width: 990*x,
    height: 720*y,
    fitColumns: false,
    rownumbers:true,
    singleSelect:true,
    autoRowHeight:false,
    columns: [
              [
               {
                 field: "model",
                 width: 230*x,
                 title: "模型",
                 align: "center"
               },
               {
                 field: "correctly",
                 title: "准确率",
                 width: 580*x,
                 align: "center"
               },
               {
                 field: "opt",
                 title: "操作",
                 width: 128*x,
                 align: "center",
                 formatter: function(index, row) {
                   var btn = '<a class="icon-edit" href="javascript:void(0)">导出</a>';
                   return btn;
                 }
               }
             ]
    ],
    data: [
      {
        model: "模型1",
        correctly: "90%"
      },
      {
        model: "模型2",
        correctly: "80%"
      },
      {
        model: "模型3",
        correctly: "85%"
      }
    ],
    idField: "id",
    loadMsg: "Loading, please waiting",
    pagination: true,
    onLoadSuccess: function(data) {
      $(".editcls").linkbutton({
        text: "导出",
        plain: true,
        iconCls: "icon-edit"
      });
    }
  });

  $("#main3").datagrid({
    showHeader: false,
    title: "训练结果",
    width: 421*x,
    height: 720*y,
    fitColumns: true,
    singleSelect:true,
    autoRowHeight:false,
    columns: [
      [
        {
          field: "text",
          width: 105*x,
          title: "训练结果",
          align: "right"
        }
      ],
      [
        {
          field: "cases",
          width: 311*x,
          title: "训练结果",
          align: "left",
        }
      ]
    ],
    data: [
      {
        text: "准确率：",
        cases: "<input value='90' />"
      },
      {
        text: "常量",
        cases: ""
      },
      {
        text: "参数1：",
        cases: "<input value='90' />"
      },
      {
        text: "参数2：",
        cases: "<input value='90' />"
      },
      {
        text: "参数3：",
        cases: "<input value='90' />"
      },
      {
        text: "参数4：",
        cases: "<input value='90' />"
      },
      {
        text: "",
        cases: ""
      },
      {
        text: "",
        cases: ""
      },
      {
        text: "",
        cases:
          "<input type='button' style='width: 80px;cursor: pointer;' value='保存' />",
      },
      {
        text: "",
        cases: ""
      },
      {
        text: "",
        cases: ""
      }
    ],
    idField: "id",
    loadMsg: "Loading, please waiting",
    pagination: false,
    rowStyler: function(index, row) {
      return "text-color: black; height: 66*y+'px'";
    },
    onLoadSuccess: function(data) {
      var panel = $(this).datagrid("getPanel");
      var tr = panel.find("div.datagrid-body tr");
      tr.each(function() {
        var td = $(this).children("td");
        td.css({
          "border-width": "0"
        });
        var ts = td.find("div.datagrid-cell");
        ts.css({
          height: "24px"
        });
      });
    }
  });
}

