<!DOCTYPE html>
<html lang="en">
    <head>
        <title id='Description'>This example shows how to create a Grid from JSON data.</title>
        <link type="text/css" rel="stylesheet" href="../../css/main.css">
        <link type="text/css" rel="stylesheet" href="../../css/styles/jqx.base.css">
        <link type="text/css" rel="stylesheet" href="../../css/grid.css">
        <link type="text/css" rel="stylesheet" href="../../css/bundled.css">
        <link type="text/css" rel="stylesheet" href="../../css/jquery-confirm.css">
        <link type="text/css" rel="stylesheet" href="../../css/scaf.css">


        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />	

        <script type="text/javascript" src="../../tradi/js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxcore.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxbuttons.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxscrollbar.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxmenu.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxcheckbox.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxgrid.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxgrid.selection.js"></script> 
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxgrid.columnsresize.js"></script> 
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxdata.js"></script> 
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxwindow.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxtoolbar.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxinput.js" ></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxdropdownlist.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxlistbox.js" ></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxcombobox.js"></script>
        <script type="text/javascript" src="../../javascript/theme.js" ></script>
        <script type="text/javascript" src="../../javascript/demos.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxdatetimeinput.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/jqxcalendar.js"></script>
        <script type="text/javascript" src="../../javascript/jqwidgets/globalization/globalize.js"></script>
        <script type="text/javascript" src="../js/search.js" ></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#btnCrear").jqxButton({width: 50, height: 35 /*imgPosition: "left", textPosition: "left", textImageRelation: "imageBeforeText", imgSrc: "../../Imagenes/nuevo42.gif"*/});
                $("#btnCrear").click(function (event) {
                    ventanaEdit();
                });
                $("#btnEditar").jqxButton({width: 50, height: 35});
                $("#btnElevar").jqxButton({width: 50, height: 35});
                $("#btnElevar").click(function (event) {
                    ventElevar();
                });

                $("#btnOpenFolder").jqxButton({width: 50});

                var url = "../../TradiController";
                // prepare the data
                var source =
                        {
                            datatype: "json",
                            datafields: [
                                {name: 'name', type: 'string'},
                                {name: 'type', type: 'string'},
                                {name: 'calories', type: 'int'},
                                {name: 'totalfat', type: 'string'},
                                {name: 'protein', type: 'string'},
                                {name: 'dirigido', type: 'string'}
                            ],
                            data: {act: 'listOfRemision'},
                            id: 'id',
                            url: url
                        };
                var dataAdapter = new $.jqx.dataAdapter(source);
                $("#grid").jqxGrid(
                        {
                            width: '100%',
                            source: dataAdapter,
                            autoheight: true,
                            columnsresize: true,
                            showtoolbar: true,
                            rendertoolbar: function (statusbar) {
                                /*
                                 // appends buttons to the status bar.
                                 var container = $("<div style='overflow: hidden; position: relative; margin: 5px;'></div>");
                                 var addButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../../javascript/images/add.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Add</span></div>");
                                 var deleteButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../../javascript/images/close.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Delete</span></div>");
                                 var reloadButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../../javascript/images/refresh.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Reload</span></div>");
                                 var searchButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../../javascript/images/search.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Find</span></div>");
                                 container.append(addButton);
                                 container.append(deleteButton);
                                 container.append(reloadButton);
                                 container.append(searchButton);
                                 statusbar.append(container);
                                 addButton.jqxButton({width: 60, height: 20});
                                 deleteButton.jqxButton({width: 65, height: 20});
                                 reloadButton.jqxButton({width: 65, height: 20});
                                 searchButton.jqxButton({width: 50, height: 20});
                                 // add new row.
                                 addButton.click(function (event) {
                                 //var datarow = generatedata(1);
                                 //$("#grid").jqxGrid('addrow', null, datarow[0]);
                                 ventanaEdit();
                                 
                                 });
                                 // delete selected row.
                                 deleteButton.click(function (event) {
                                 var selectedrowindex = $("#grid").jqxGrid('getselectedrowindex');
                                 var rowscount = $("#grid").jqxGrid('getdatainformation').rowscount;
                                 var id = $("#grid").jqxGrid('getrowid', selectedrowindex);
                                 $("#grid").jqxGrid('deleterow', id);
                                 });
                                 // reload grid data.
                                 reloadButton.click(function (event) {
                                 $("#grid").jqxGrid({source: getAdapter()});
                                 });
                                 // search for a record.
                                 searchButton.click(function (event) {
                                 var offset = $("#grid").offset();
                                 $("#jqxwindow").jqxWindow('open');
                                 $("#jqxwindow").jqxWindow('move', offset.left + 30, offset.top + 30);
                                 });*/

                            },
                            /*selectionmode: 'checkbox',
                             altrows: true,*/
                            columns: [
                                {text: 'T.documento', datafield: 'name', width: 250},
                                {text: 'Número', datafield: 'type', width: 250},
                                {text: 'Asunto', datafield: 'calories', width: 180},
                                {text: 'Fecha', datafield: 'totalfat', width: 120},
                                {text: 'Prioridad', datafield: 'protein', minwidth: 120},
                                {text: 'Dirigido a', datafield: 'dirigido', minwidth: 120}
                            ]
                        });
                $("#grid").on('rowselect', function (event) {
                    //$("#selectrowindex").text(event.args.rowindex);
                    /*var row = event.args.row;
                     alert(row.name);
                     ventanaEdit();*/
                });
                $("#grid").on('rowdoubleclick', function (event) {
                    //$("#selectrowindex").text(event.args.rowindex);
                    var index = event.args.rowindex;
                    //var rowindex = $("#grid").jqxGrid('getselectedrowindex');
                    var dataRecord = $("#grid").jqxGrid('getrowdata', index);
                    ventanaEdit();
                    $("#txtname").val(dataRecord.name);
                });
                $("#toolbarHome").jqxToolBar({
                    width: '100%', height: 45, tools: 'custom dropdownlist | custom dropdownlist | custom dropdownlist',
                    initTools: function (type, index, tool, menuToolIninitialization) {
                        switch (index) {
                            case 0:
                                tool.append("<div style='font-weight: bold;padding-top: 7px; '>Periodo :</div>");
                                break;
                            case 1:
                                tool.jqxDropDownList({width: 130, source: [2021, 2020], selectedIndex: 1});
                                break;
                            case 2:
                                tool.append("<div style='font-weight: bold;bold;padding-top: 7px;'>Mes :</div>");
                                break;
                            case 3:
                                tool.jqxDropDownList({width: 50, source: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12], selectedIndex: 3});
                                break;
                            case 4:
                                tool.append("<div style='font-weight: bold;bold;padding-top: 7px;'>Estado :</div>");
                                break;
                            case 5:
                                tool.jqxDropDownList({width: 200, source: ["Remitido", "Aprobado"], selectedIndex: 3});
                                break;
                        }
                    }
                });
                function ventanaEdit() {
                    var jqxWidget = $('#jqxWidget');
                    var offset = jqxWidget.offset();
                    /*$('#window').jqxWindow({
                     position: {x: offset.left + 50, y: offset.top + 50},
                     isModal: true,
                     autoOpen: false,
                     modalOpacity: 0.5,
                     showCollapseButton: true,
                     
                     minWidth: 200,
                     maxWidth: 700,
                     maxHeight: 400,
                     minHeight: 200,
                     
                     height: 400,
                     width: 600,
                     initContent: function () {
                     //$('#tab').jqxTabs({ height: '100%', width:  '100%' });
                     $('#window').jqxWindow('focus');
                     $("#txtname").jqxInput({width: '80px', height: '30px'});
                     
                     }
                     });
                     //$('#window').jqxWindow({isModal: true, modalOpacity: 0.5});
                     $('#window').jqxWindow('open');
                     $("#window").css("z-index", "30000");
                     $("#windowFooter").jqxToolBar({
                     width: '100%', height: 45, tools: 'toggleButton | toggleButton toggleButton | toggleButton',
                     initTools: function (type, index, tool, menuToolIninitialization) {
                     if (type == "toggleButton") {
                     var icon = $("<div class='jqx-editor-toolbar-icon jqx-editor-toolbar-icon-" + theme + " buttonIcon'>aaaa</div>");
                     }
                     switch (index) {
                     
                     case 3:
                     tool.jqxToggleButton({width: 80, toggled: true, disabled: false});
                     tool.text("Grabar");
                     tool.on("click", function () {
                     /*var toggled = tool.jqxToggleButton("toggled");
                     if (toggled) {
                     tool.text("Enabled");
                     }else {
                     tool.text("Disabled");
                     }*
                     tool.jqxToggleButton({disabled: true});
                     $('#window').jqxWindow('close');
                     });
                     break;
                     
                     }
                     }
                     });*/

                    var theme = getTheme();
                    var posicionX, posicionY;
                    var ancho = 700;
                    var alto = 330;
                    posicionX = ($(window).width() / 2) - (ancho / 2);
                    posicionY = ($(window).height() / 2) - (alto / 2);
                    $('#windowCrear').jqxWindow({
                        position: {x: posicionX, y: posicionY},
                        width: ancho, height: alto, resizable: false,
                        cancelButton: $('#btn_CancelarPassword'),
                        initContent: function () {
                            $("#txt_dependencia").jqxInput({theme: theme, placeHolder: "", height: 20, width: 200, minLength: 1, maxLength: 35});
                            $("#cmb_prioridad").jqxDropDownList({theme: theme, height: 20, width: 200});
                            $("#cmb_tipodoc").jqxDropDownList({theme: theme, height: 20, width: 200});
                            $("#cmb_clasificacion").jqxDropDownList({theme: theme, height: 20, width: 200});
                            $("#txt_numDoc").jqxInput({theme: theme, placeHolder: "", height: 20, width: 200, minLength: 1, maxLength: 35});
                            $("#txt_fechaDoc").jqxDateTimeInput({width: '200px', height: '25px'});
                            $("#txt_asunto").jqxInput({theme: theme, placeHolder: "", height: 20, width: 340, minLength: 1, maxLength: 420});
                            $("#txt_dirigidoa").jqxInput({theme: theme, placeHolder: "", height: 20, width: 200, minLength: 1, maxLength: 120});
                            $("#txt_puesto").jqxInput({theme: theme, placeHolder: "", height: 20, width: 200, minLength: 1, maxLength: 120});
                            $('#btn_crear').jqxButton({width: '65px', height: 22});
                            $('#btn_crear').on('click', function (event) {
                                $('#frm_Password').jqxValidator('validate');
                            });
                            $('#btn_cancelar').jqxButton({width: '65px', height: 22});
                            $("#btn_adjuntar").jqxButton({width: 50, height: 22});
                            /*$("#txt_dependencia").on("keypress", function (event) {
                             if($("#txt_dependencia").val().length>=3){
                             $("#searhfilterpanel").addClass("show");
                             }
                             });*/
                        }
                    });
                    $('#windowCrear').jqxWindow({isModal: true, modalOpacity: 0.6});
                    $('#windowCrear').jqxWindow('open');
                    /*var button = $("<button id='custom1'>Cancelar</button>");
                     $("#windowFooter").jqxToolBar("toolbar").append(button);
                     button.jqxButton({
                     height: 23,
                     width: 20,
                     disabled: true
                     });
                     //$("#jqxHTMLButton").jqxButton({ value: "<span style='font-style: italic;'>Clicked!</span>" });
                     button.on('click', function () {
                     alert('i am not disabled');
                     });*/
                }
                function ventElevar() {
                    var theme = getTheme();
                    var posicionX, posicionY;
                    var ancho = 350;
                    var alto = 530;
                    posicionX = ($(window).width() / 2) - (ancho / 2);
                    posicionY = ($(window).height() / 2) - (alto / 2);
                    $('#windowElevar').jqxWindow({
                        position: {x: posicionX, y: posicionY},
                        width: ancho, height: alto, resizable: false,
                        cancelButton: $('#btn_CancelarPassword'),
                        initContent: function () {
                            $("#txt_pin").jqxInput({theme: theme, placeHolder: "", height: 20, width: 200, minLength: 1, maxLength: 35});
                            $("#txt_recibe").jqxInput({theme: theme, placeHolder: "", height: 20, width: 200, minLength: 1, maxLength: 35});
                            $("#cmb_destinatario").jqxDropDownList({theme: theme, height: 20, width: 200});
                            
                            $('#btn_elevar').jqxButton({width: '65px', height: 22});
                            $('#btn_elevar').on('click', function (event) {
                                //$('#frm_Password').jqxValidator('validate');
                            });
                            $('#btn_elev_cancelar').jqxButton({width: '65px', height: 22});
                            $("#btn_elev_adjuntar").jqxButton({width: 50, height: 22});
                        }
                    });
                    $('#windowElevar').jqxWindow({isModal: true, modalOpacity: 0.6});
                    $('#windowElevar').jqxWindow('open');
                }
                function loadInstituciones() {
                    $.ajax({
                        url: '../../TradiController',
                        type: 'post',
                        data: {
                            act: 'ginsticion'
                        },
                        success: function (response) {
                            var json = jQuery.parseJSON(response);
                            $("#searhfilterpanel").empty();
                            for (var i = 0; i < json.length; i++) {
                                var row = json[i];
                                $("#searhfilterpanel").append("<li class='dropdown-item-seach flex-nowrap d-none' data='" + row.id + "'>" + row.desc + "</li>");
                            }

                        },
                        error: function () {

                        }
                    });
                }
                function loadPrioridad() {
                    $.ajax({
                        url: '../../TradiController',
                        type: 'post',
                        data: {
                            act: 'gprioridad'
                        },
                        success: function (response) {
                            var json = jQuery.parseJSON(response);
                            $("#cmb_prioridad").empty();
                            for (var i = 0; i < json.length; i++) {
                                var row = json[i];
                                $("#cmb_prioridad").append("<option value='" + row.id + "'>" + row.desc + "</option>");
                            }

                        },
                        error: function () {

                        }
                    });
                }
                function loadTipoDoc() {
                    $.ajax({
                        url: '../../TradiController',
                        type: 'post',
                        data: {
                            act: 'gTipoDoc'
                        },
                        success: function (response) {
                            var json = jQuery.parseJSON(response);
                            $("#cmb_tipodoc").empty();
                            for (var i = 0; i < json.length; i++) {
                                var row = json[i];
                                $("#cmb_tipodoc").append("<option value='" + row.id + "'>" + row.desc + "</option>");
                            }

                        },
                        error: function () {

                        }
                    });
                }
                function loadClasificacion() {
                    $.ajax({
                        url: '../../TradiController',
                        type: 'post',
                        data: {
                            act: 'gClasificacion'
                        },
                        success: function (response) {
                            var json = jQuery.parseJSON(response);
                            $("#cmb_clasificacion").empty();
                            for (var i = 0; i < json.length; i++) {
                                var row = json[i];
                                $("#cmb_clasificacion").append("<option value='" + row.id + "'>" + row.desc + "</option>");
                            }

                        },
                        error: function () {

                        }
                    });
                }
                loadInstituciones();
                loadPrioridad();
                loadTipoDoc();
                loadClasificacion();
            });
        </script>
        <style>
            .justify-content-between {
                -webkit-box-pack: justify!important;
                -ms-flex-pack: justify!important;
                justify-content: space-between!important;
            }
            .d-flex {
                display: -webkit-box!important;
                display: -ms-flexbox!important;
                display: flex!important;
            }
            .tbl-rows{
                border-collapse:separate; border-spacing: 0 0.5em;
            }
            #searhfilterpanel>li {
                cursor: pointer;
            }
            .dropdown-item-seach {
                color: #333;
                margin-left: 1.5rem;
                margin-right: 1.5rem;
                position: relative;
                width: auto;
                display: flex;
                flex-flow: nowrap;
                align-items: center;
                font-weight: 400;
                text-decoration: none;
                font-size: .8125rem;
                border-radius: .125rem;
                margin: 0 .3125rem;
                transition: all .15s linear;
                min-width: 7rem;
                padding: .625rem 1.25rem !important;
                overflow: hidden;
                line-height: 1.428571;
                text-overflow: ellipsis;
                white-space: nowrap!important;
            }
            .dropdown-item-seach:hover{background-color:rgba(25, 25, 25, 0.3);color:#333;}
            .dropdown-item-seach.active,.dropdown-item-seach:active{color:#fff;background-color:#6eac2c;}
            .dropdown-menu.show, .open>.dropdown-menu {
                display: block;
                opacity: 1;
                transform: scale(1);
            }
            .dropdown-menu.show {
                display: block;
            }
            .dropdown-menu {
                display: none;
                padding: .3125rem 0;
                border: 0;
                opacity: 0;
                transform: scale(0);
                transform-origin: 0 0;
                will-change: transform,opacity;
                transition: transform .3s cubic-bezier(.4,0,.2,1),opacity .2s cubic-bezier(.4,0,.2,1);
                box-shadow: 0 5px 20px 10px rgb(0 0 0 / 26%);
            }
            .ml-3, .mx-3 {
                margin-left: 1rem!important;
            }
            .dropdown-menu {
                position: absolute;
                top: 100%;
                left: 0;
                z-index: 1000;
                float: left;
                min-width: 10rem;
                padding: .5rem 0;
                margin: .125rem 0 0;
                font-size: 1rem;
                color: #212529;
                text-align: left;
                list-style: none;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid rgba(0,0,0,.15);
                border-radius: .25rem;
                box-shadow: 0 2px 2px 0 rgb(0 0 0 / 14%), 0 3px 1px -2px rgb(0 0 0 / 20%), 0 1px 5px 0 rgb(0 0 0 / 12%);
            }
            .d-none{
                display: none;
            }

        </style>

    </head>
    <body class='default' style="padding-top: 0px;margin:5px">
        <div id="jqxWidget" style="margin-right: 15px;">
            <div align="center" class="jqx-hideborder jqx-widget-header  jqx-fill-state-pressed-ui-start jqx-expander-header-expanded jqx-expander-header-expanded-ui-start jqx-expander-header jqx-expander-header-ui-start jqx-expander-header-disabled jqx-expander-header-disabled-ui-start">
                Remisión de documentos</div>
            <div id="toolbarHome"> <div clas="btn">asas</div>  </div>
            <div  class="d-flex justify-content-between" style="margin-top: 2px;margin-bottom: 2px;">
                <div class="">
                    <button id="btnCrear" title="Crear Documento"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark" viewBox="0 0 16 16">
                        <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
                        </svg>
                    </button>

                    <button id="btnEditar" title="Editar Documento">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                        </svg>
                    </button>
                    <button id="btnElevar" title="Elevar Documento" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-layer-forward" viewBox="0 0 16 16">
                        <path d="M8.354.146a.5.5 0 0 0-.708 0l-3 3a.5.5 0 0 0 0 .708l1 1a.5.5 0 0 0 .708 0L7 4.207V12H1a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-2a1 1 0 0 0-1-1H9V4.207l.646.647a.5.5 0 0 0 .708 0l1-1a.5.5 0 0 0 0-.708l-3-3z"/>
                        <path d="M1 7a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h4.5a.5.5 0 0 0 0-1H1V8h4.5a.5.5 0 0 0 0-1H1zm9.5 0a.5.5 0 0 0 0 1H15v2h-4.5a.5.5 0 0 0 0 1H15a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1h-4.5z"/>
                        </svg>
                    </button>
                </div>
                <div id="btnOpenFolder" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder2-open" viewBox="0 0 16 16">
                    <path d="M1 3.5A1.5 1.5 0 0 1 2.5 2h2.764c.958 0 1.76.56 2.311 1.184C7.985 3.648 8.48 4 9 4h4.5A1.5 1.5 0 0 1 15 5.5v.64c.57.265.94.876.856 1.546l-.64 5.124A2.5 2.5 0 0 1 12.733 15H3.266a2.5 2.5 0 0 1-2.481-2.19l-.64-5.124A1.5 1.5 0 0 1 1 6.14V3.5zM2 6h12v-.5a.5.5 0 0 0-.5-.5H9c-.964 0-1.71-.629-2.174-1.154C6.374 3.334 5.82 3 5.264 3H2.5a.5.5 0 0 0-.5.5V6zm-.367 1a.5.5 0 0 0-.496.562l.64 5.124A1.5 1.5 0 0 0 3.266 14h9.468a1.5 1.5 0 0 0 1.489-1.314l.64-5.124A.5.5 0 0 0 14.367 7H1.633z"/>
                    </svg>
                </div>
            </div>
            <div id="grid"></div>
            <div id="windowCrear" style="display: none">
                <div>
                    <span style="float: left">Crear Documento</span>
                </div>
                <div style="overflow: hidden;" id="windowContent">
                    <table >
                        <tr>
                            <td valign="top" >
                                <table class="tbl-rows">
                                    <tr>
                                        <td class="inputlabel">Dependencia:</td>
                                        <td>
                                            <input id="txt_dependenciaid" type="hidden">
                                            <input id="txt_dependencia" type="text" value="" class="form-control form-controls" placeholder="Buscar..." onkeyup="filtraropciones(event, this.value, '')" onblur="hideSearchFilterPanel()" onfocus="showSearchFilter()">

                                            <ul id="searhfilterpanel" class="dropdown-menu dropdown-menu-right ml-3 " style="top: 60px;max-height: 200px;overflow: auto;width: 200px;left: 136px;"  onmouseover="setMouseOverOnFilterBox(true);" onmouseout="setMouseOverOnFilterBox(false);">
                                                <li class="dropdown-item-seach flex-nowrap d-none">Tramites y Requisitos - Admin</li>
                                                <li class="dropdown-item-seach flex-nowrap ">Atender Solicitud de Correos Institucionales</li>
                                                <li class="dropdown-item-seach flex-nowrap d-none">Ficha del Alumno</li>
                                                <li class="dropdown-item-seach flex-nowrap d-none">Hoja de Vida del Colaborador</li>
                                                <li class="dropdown-item-seach flex-nowrap d-none">Boleta de Pago Trabajador</li>
                                                <li class="dropdown-item-seach flex-nowrap d-none">Directorio Alumno</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="inputlabel">Prioridad:</td>
                                        <td><select id="cmb_prioridad" ><option value="1">ASAP</option><option value="2">EDP</option></select></td>
                                    </tr>
                                    <tr>
                                        <td class="inputlabel">Tipo de Documento:</td>
                                        <td >
                                            <select id="cmb_tipodoc" class="form-select">
                                                <option value="1">Informe</option>
                                                <option value="2">Oficio</option>
                                                <option value="3">asd</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="inputlabel">Nro.Documento:</td>
                                        <td ><input type="text"  class="form-control" id="txt_numDoc" ></td>
                                    </tr>
                                    <tr>
                                        <td class="inputlabel">Clasificación:</td>
                                        <td >
                                            <select id="cmb_clasificacion" class="form-select" >
                                                <option value="1">Privado</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="inputlabel">Fecha de Documento:</td>
                                        <td >
                                            <div id='txt_fechaDoc'> </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="font-weight:bold;font-size: 12px;color: #666666;" colspan="2">
                                            Asunto:<input type="text"  class="form-control" id="txt_asunto" ></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 20px;">&nbsp;</td>
                            <td valign="top">
                                <table >
                                    <tr>
                                        <td class="inputlabel">Dirigido a:</td>
                                        <td><input type="text"  class="form-control" id="txt_dirigidoa" ></td>
                                    </tr>
                                    <tr>

                                        <td class="inputlabel">Puesto:</td>
                                        <td><input type="text"  class="form-control" id="txt_puesto" ></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="list-group">
                                                <div class="list-group-item list-group-item-action bg-light d-flex justify-content-between" style="background: #ececec;" aria-current="true">
                                                    <span>Referencias</span>
                                                    <label for="file-aaaa" id="btn_adjuntar" class="btn btn-outline-success btn-sm px-1 py-1 my-0" style="width: 30px;height: 30px;">
                                                        <svg id="imgadd-aaaa"  width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-paperclip" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/></svg>
                                                        <input class="inputfile" type="file" id="file-aaaa"  name="file-aaaa" onchange="uploadToServer2(this, 'namefile', '001')" style="visibility:hidden;" accept=".*" >
                                                    </label>
                                                </div>
                                                <button type="button" class="list-group-item list-group-item-action">Referencia 1</button>
                                                <button type="button" class="list-group-item list-group-item-action">Referencia 2</button>
                                                <button type="button" class="list-group-item list-group-item-action" disabled>Referencia 3</button>

                                            </div>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table style="width: 100%">

                        <tr>
                            <td class="Summit" colspan="2">
                                <div>
                                    <input type="button" id="btn_crear" value="Crear" style="margin-right: 20px" />
                                    <input type="button" id="btn_cancelar" value="Cancelar" style="margin-right: 20px"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div id="windowFooter" style="    position: absolute; bottom: 0;left: 0;border:0;border-top: 1px solid #ccc; border-radius: 0;" align="right">

                    </div>
                </div>
            </div>

        </div>


        <div id="windowElevar" style="display: none">
            <div>
                <span style="float: left">Elevar Documento</span>
            </div>
            <div style="overflow: hidden;" id="windowContent">
                <table style="width: 100%">
                    <tr>
                        <td>
                            <label class="inputlabel">Ingrese su PIN</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="form-control" type="password" id="txt_pin">
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label  class="inputlabel">Derivar A:</label></td>
                    </tr>
                    <tr>
                        <td><input class="form-control" type="text" id="txt_recibe"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="list-group">
                                <div class="list-group-item list-group-item-action bg-light d-flex justify-content-between" style="background: #ececec;" aria-current="true">
                                    <span>Referencias</span>
                                    <label for="file-aaaa" id="btn_elev_adjuntar" class="btn btn-outline-success btn-sm px-1 py-1 my-0" style="width: 30px;height: 30px;">
                                        <svg id="imgadd-aaaa"  width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-paperclip" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/></svg>
                                        <input class="inputfile" type="file" id="file-aaaa"  name="file-aaaa" onchange="uploadToServer2(this, 'namefile', '001')" style="visibility:hidden;" accept=".*" >
                                    </label>
                                </div>
                                <button type="button" class="list-group-item list-group-item-action">Referencia 1</button>
                                <button type="button" class="list-group-item list-group-item-action">Referencia 2</button>
                                <button type="button" class="list-group-item list-group-item-action" disabled>Referencia 3</button>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="inputlabel">Destinatario:</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select id="cmb_destinatario" class="form-select" aria-label="Default select example">
                                <option value="1">Destino 1</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div id="windowFooter" style="    position: absolute; bottom: 0;left: 0;border:0;border-top: 1px solid #ccc; border-radius: 0;width: 100%" align="right">
                    <table style="width: 100%">
                        <tr>
                            <td class="Summit" colspan="2">
                                <div>
                                    <input type="button" id="btn_elevar" value="Elevar" style="margin-right: 20px" />
                                    <input type="button" id="btn_elev_cancelar" value="Cancelar" style="margin-right: 20px"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>

    </body>
</html>
