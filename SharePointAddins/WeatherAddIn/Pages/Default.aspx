<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Office UI Fabric -->
    <link rel="stylesheet" href="https://static2.sharepointonline.com/files/fabric/office-ui-fabric-core/9.6.0/css/fabric.min.css" />

    <!-- Office UI Fabric JS -->
    <link rel="stylesheet" href="https://static2.sharepointonline.com/files/fabric/office-ui-fabric-js/1.2.0/css/fabric.min.css" />
    <link rel="stylesheet" href="https://static2.sharepointonline.com/files/fabric/office-ui-fabric-js/1.2.0/css/fabric.components.min.css" />
    <script type="text/javascript" src="https://static2.sharepointonline.com/files/fabric/office-ui-fabric-js/1.2.0/js/fabric.min.js"></script>

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Weather Add-in
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div class="ms-Fabric">
        <div class="ms-Grid">
            <div class="ms-Grid-row">
                <div class="ms-Grid-col ms-sm3 ms-md3 ms-lg3">
                    <div class="ms-Dropdown">
                        <label class="ms-Label">Select a city:</label>
                        <i class="ms-Dropdown-caretDown ms-Icon ms-Icon--ChevronDown"></i>
                        <select class="ms-Dropdown-select" id="selectCity">
                            <option></option>
                            <%--
                            <option value="4887398">Chicago</option>
                            <option value="5368361">Los Angeles</option>
                            <option value="4164138">Miami</option>
                            <option value="5128638">New York</option>
                            <option value="5809844">Seattle</option>
                            --%>
                        </select>
                    </div>
                </div>
                <div class="ms-Grid-col ms-sm1 ms-md1 ms-lg1">&nbsp;</div>
                <div class="ms-Grid-col ms-sm8 ms-md8 ms-lg8">
                    <div class="ms-font-su ms-fontColor-themePrimary">Weather today in <span id="cityName"></span></div>
                    <table>
                        <tr>
                            <td>
                                <i class="ms-Icon ms-Icon--CloudWeather ms-font-xl" aria-hidden="true"></i>
                                <span class="ms-font-l ms-fontWeight-semibold">Conditions:</span>
                            </td>
                            <td><span id="weatherConditions" class="ms-font-l"></span></td>
                        </tr>
                        <tr>
                            <td>
                                <i class="ms-Icon ms-Icon--AzureKeyVault ms-font-xl" aria-hidden="true"></i>
                                <span class="ms-font-l ms-fontWeight-semibold">Temperature:</span>
                            </td>
                            <td><span id="weatherTemperature" class="ms-font-l"></span>&deg;C</td>
                        </tr>
                        <tr>
                            <td>
                                <i class="ms-Icon ms-Icon--AutoRacing ms-font-xl" aria-hidden="true"></i>
                                <span class="ms-font-l ms-fontWeight-semibold">Humidity:</span>
                            </td>
                            <td><span id="weatherHumidity" class="ms-font-l"></span>%</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
