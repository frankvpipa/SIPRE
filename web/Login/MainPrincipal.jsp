<%-- 
    Document   : MainPrincipal
    Created on : 16/01/2017, 08:35:38 AM
    Author     : H-URBINA-M
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<%@include file="../WEB-INF/jspf/browser.jspf" %>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Last-Modified" content="0"/>
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate"/>
        <meta http-equiv="Pragma" content="no-cache"/>
        <link type="text/css" rel="stylesheet" href="../css/main.css">
        <link type="text/css" rel="stylesheet" href="../css/styles/jqx.base.css">
        <link type="text/css" rel="stylesheet" href="../css/grid.css">
        <link type="text/css" rel="stylesheet" href="../css/bundled.css">
        <link type="text/css" rel="stylesheet" href="../css/jquery-confirm.css">
        <link type="text/css" rel="stylesheet" href="../css/scaf.css">
        <script type="text/javascript" src="../javascript/validacion.js"></script>
        <script type="text/javascript" src="../javascript/bundled.js"></script>
        <script type="text/javascript" src="../javascript/jquery.js"></script>
        <script type="text/javascript" src="../javascript/jquery-confirm.js"></script>
        <script type="text/javascript" src="../javascript/theme.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxcore.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxmenu.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxsplitter.js"></script> 
        <script type="text/javascript" src="../javascript/jqwidgets/jqxbuttons.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxscrollbar.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxpanel.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxtree.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxexpander.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxlistbox.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxcombobox.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxtooltip.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxdropdownlist.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxdata.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxdata.export.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.columnsresize.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.columnsreorder.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.pager.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.sort.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.filter.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.storage.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.selection.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.export.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.filter.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.edit.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.aggregates.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxgrid.grouping.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxnumberinput.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxcheckbox.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxinput.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxmaskedinput.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxpasswordinput.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxtextarea.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxdatetimeinput.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxcalendar.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxwindow.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxvalidator.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxradiobutton.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxnotification.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxpopover.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/jqxtabs.js"></script> 
        <script type="text/javascript" src="../javascript/jqwidgets/jqxfileupload.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/globalization/globalize.js"></script>
        <script type="text/javascript" src="../javascript/jqwidgets/globalization/globalize.culture.es-PE.js"></script>
        <script type="text/javascript" src="../javascript/pdfobject.js" ></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var theme = getTheme();
                var posicionX, posicionY;
                var ancho = 400;
                var alto = 200;
                posicionX = ($(window).width() / 2) - (ancho / 2);
                posicionY = ($(window).height() / 2) - (alto / 2);
                $('#div_WindowPassword').jqxWindow({
                    position: {x: posicionX, y: posicionY},
                    width: ancho, height: alto, resizable: false,
                    cancelButton: $('#btn_CancelarPassword'),
                    initContent: function () {
                        $("#txt_UsuarioPassword").jqxInput({theme: theme, placeHolder: "USUARIO", height: 20, width: 200, minLength: 1, maxLength: 10, disabled: true});
                        $("#txt_NombresPassword").jqxInput({theme: theme, placeHolder: "NOMBRES", height: 20, width: 200, minLength: 1, maxLength: 25});
                        $("#txt_ApellidosPassword").jqxInput({theme: theme, placeHolder: "APELLIDOS", height: 20, width: 200, minLength: 1, maxLength: 35});
                        $("#txt_InicialesPassword").jqxInput({theme: theme, placeHolder: "INICIALES", height: 20, width: 200, minLength: 1, maxLength: 10});
                        $("#txt_PasswordRegistro").jqxPasswordInput({theme: theme, placeHolder: "CONTRASE??A", width: 200, height: 20, maxLength: 200, showStrength: true, showStrengthPosition: "right"});
                        $("#txt_CompruebaPassword").jqxPasswordInput({theme: theme, placeHolder: "COMPROBAR CONTRASE??A", width: 200, maxLength: 200, height: 20, showStrength: true, showStrengthPosition: "right"});
                        $('#btn_CancelarPassword').jqxButton({width: '65px', height: 22});
                        $('#btn_GuardarPassword').jqxButton({width: '65px', height: 22});
                        $('#btn_GuardarPassword').on('click', function (event) {
                            $('#frm_Password').jqxValidator('validate');
                        });
                        $('#frm_Password').jqxValidator({
                            rules: [
                                {input: '#txt_UsuarioPassword', message: 'Ingrese el Usuario (CIP o DNI)!', action: 'keyup, blur', rule: 'required'},
                                {input: '#txt_UsuarioPassword', message: 'Ingrese Solo Numeros (CIP o DNI)!', action: 'keyup, blur', rule: 'number'},
                                {input: '#txt_NombresPassword', message: 'Ingrese sus Nombres!', action: 'keyup, blur', rule: 'required'},
                                {input: '#txt_ApellidosPassword', message: 'Ingrese sus Apellidos!', action: 'keyup, blur', rule: 'required'},
                                {input: '#txt_InicialesPassword', message: 'Ingrese sus Iniciales!', action: 'keyup, blur', rule: 'required'},
                                {input: '#txt_PasswordRegistro', message: 'Ingrese una Contrase??a!', action: 'keyup, blur', rule: 'required'},
                                {input: '#txt_CompruebaPassword', message: 'Confirme Contrase??a!', action: 'keyup, blur', rule: 'required'},
                                {input: '#txt_CompruebaPassword', message: 'Contrase??a no coincide!', action: 'keyup, focus', rule: function (input, commit) {
                                        if (input.val() === $('#txt_PasswordRegistro').val()) {
                                            return true;
                                        }
                                        return false;
                                    }
                                }
                            ]
                        });
                        $('#frm_Password').jqxValidator({
                            onSuccess: function () {
                                fn_cambiarPassword();
                            }
                        });
                    }
                });
                var rss = (function ($) {
                    var createWidgets = function () {
                        $('#div_Splitter').jqxSplitter({theme: theme, width: '100%', height: '100%', panels: [{size: 300}]});
                        $("#div_Expander").jqxExpander({toggleMode: 'none', showArrow: false, width: "100%", height: "100%",
                            initContent: function () {
                                $('#div_Tree').jqxTree({height: '100%', width: '100%'});
                            }
                        });
                        $("#div_Panel").jqxPanel({width: '100%', height: '100%'});
                        
                    };
                    var addEventListeners = function () {
                        $('#div_Tree').on('select', function (event) {
                            var item = $('#div_Tree').jqxTree('getItem', event.args.element).id;
                            var name = $(event.args.element).attr("name");
                            if (item !== "0") {
                                if(name!==undefined && name.includes("tradi")){
                                    $('#div_Contenido').html('<img src="../Imagenes/Fondos/cargando.gif">');
                                    $('#div_Contenido').html("<iframe src='../"+item+"' style='width:100%;height: 99%;border: 0px;'></iframe>");
                                }else if (item === '1') {
                                    $.ajax({
                                        type: "GET",
                                        url: "../Usuario",
                                        data: {mode: 'U', usuario: '${usuario}'},
                                        success: function (data) {
                                            var dato = data.split("+++");
                                            if (dato.length === 8) {
                                                $("#txt_UsuarioPassword").val('${usuario}');
                                                $("#txt_NombresPassword").val(dato[2]);
                                                $("#txt_ApellidosPassword").val(dato[1]);
                                                $("#txt_InicialesPassword").val(dato[3]);
                                                $("#txt_PasswordRegistro").val("");
                                                $("#txt_CompruebaPassword").val("");
                                            }
                                        }
                                    });
                                    $('#div_WindowPassword').jqxWindow({isModal: true, modalOpacity: 0.9});
                                    $('#div_WindowPassword').jqxWindow('open');
                                } else if (item === '2') {
                                    window.location = "../FinalizaSesion";
                                } else {
                                    $('#div_Splitter').jqxSplitter('collapse');
                                    var index = item.indexOf("/");
                                    fn_CargarMenu(item.substr(0, index), item.substr(index + 1));
                                }
                            }
                        });
                    };
                    function fn_CargarMenu(servlet, mode) {
                        var $contenidoAjax = $('#div_Contenido').html('<img src="../Imagenes/Fondos/cargando.gif">');
                        $.ajax({
                            type: "POST",
                            url: "../" + servlet,
                            data: {mode: mode},
                            success: function (data) {
                                $contenidoAjax.html(data);
                            }
                        });
                    }
                    return {
                        init: function () {
                            createWidgets();
                            addEventListeners();
                        }
                    };
                }(jQuery));
                rss.init();
            });
            function fn_cambiarPassword() {
                var usuario = $("#txt_UsuarioPassword").val();
                var nombres = $("#txt_NombresPassword").val();
                var apellidos = $("#txt_ApellidosPassword").val();
                var iniciales = $("#txt_InicialesPassword").val();
                var password = $("#txt_PasswordRegistro").val();
                $.ajax({
                    type: "POST",
                    url: "../IduUsuario",
                    data: {mode: 'P', usuario: usuario, apellidos: apellidos, nombres: nombres, iniciales: iniciales, password: password},
                    success: function (data) {
                        msg = data;
                        if (msg === "GUARDO") {
                            $.confirm({
                                title: 'AVISO DEL SISTEMA',
                                content: 'Datos procesados correctamente!!',
                                type: 'green',
                                typeAnimated: true,
                                autoClose: 'cerrarAction|1000',
                                buttons: {
                                    cerrarAction: {
                                        text: 'Cerrar',
                                        action: function () {
                                            $('#div_WindowPassword').jqxWindow('close');
                                            $("#div_WindowPassword").remove();
                                        }
                                    }
                                }
                            });
                        } else {
                            $.alert({
                                theme: 'material',
                                title: 'AVISO DEL SISTEMA',
                                content: msg,
                                animation: 'zoom',
                                closeAnimation: 'zoom',
                                type: 'red',
                                typeAnimated: true
                            });
                        }
                    }
                });
            }
        </script>
    </head> 
    <body oncontextmenu='return false'>
        <div id="div_Splitter">
            <div>
                <div style="border: none;" id="div_Expander">
                    <div class="jqx-hideborder">Menu Opciones</div>
                    <div id="div_Menu" style="background: black"><%@ include file="MenuOpciones.jsp"%></div>
                </div>
            </div>
            <div>
                <div id="div_Panel">
                    <div id="div_Contenido" style="height: 100%"><%@ include file="LogoPresentacion.jsp"%></div>  
                </div>
            </div>
        </div>
    </body>
</html>
<div id="div_WindowPassword" style="display: none">
    <div>
        <span style="float: left">REGISTRO DE USUARIOS</span>
    </div>
    <div style="overflow: hidden">
        <form id="frm_Password" name="frm_Password" method="POST" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="inputlabel">Usuario : </td>
                    <td style="text-align: left"><input type="text" id="txt_UsuarioPassword" name="txt_UsuarioPassword"/></td>
                </tr>
                <tr>
                    <td class="inputlabel">Nombres : </td>
                    <td style="text-align: left"><input type="text" id="txt_NombresPassword" name="txt_Nombres" style="text-transform: uppercase;"/></td>
                </tr>
                <tr>
                    <td class="inputlabel" >Apellidos : </td>
                    <td style="text-align: left"><input type="text" id="txt_ApellidosPassword" name="txt_Apellidos" style="text-transform: uppercase;"/></td>
                </tr>
                <tr>
                    <td class="inputlabel" >Iniciales : </td>
                    <td style="text-align: left"><input type="text" id="txt_InicialesPassword" name="txt_Iniciales" style="text-transform: uppercase;"/></td>
                </tr>
                <tr>
                    <td class="inputlabel">Nuevo Password : </td>
                    <td style="text-align: left"><input type="password" name="txt_PasswordRegistro" id="txt_PasswordRegistro"/></td>
                </tr>
                <tr>
                    <td class="inputlabel">Comprobar  password : </td>
                    <td style="text-align: left"><input type="password" name="txt_CompruebaPassword" id="txt_CompruebaPassword"/></td>
                </tr>
                <tr>
                    <td class="Summit" colspan="2">
                        <div>
                            <input type="button" id="btn_GuardarPassword" value="Guardar" style="margin-right: 20px" />
                            <input type="button" id="btn_CancelarPassword" value="Cancelar" style="margin-right: 20px"/>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>