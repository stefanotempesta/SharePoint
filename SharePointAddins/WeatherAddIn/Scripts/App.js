'use strict';

ExecuteOrDelayUntilScriptLoaded(initializePage, "sp.js");
const weatherApiAppId = "<YOUR API KEY>";

function initializePage()
{
    var hostUrl = decodeURIComponent(getQueryStringParameter("SPHostUrl"));
    var context = SP.ClientContext.get_current();
    var appContext = new SP.AppContextSite(context, hostUrl);

    // This code runs when the DOM is ready and creates a context object which is needed to use the SharePoint object model
    $(document).ready(function () {
        $.when(loadData())
            .then(initFabricUI())
            .then(initEventHandlers());
    });

    function initFabricUI() {
        var dropdownHTMLElements = document.querySelectorAll('.ms-Dropdown');
        for (var i = 0; i < dropdownHTMLElements.length; ++i) {
            new fabric['Dropdown'](dropdownHTMLElements[i]);
        }
    }

    function initEventHandlers() {
        $("#selectCity").on("change", function () {
            getWeather(this.value);
        });
    }

    var cityListItems;
    function loadData() {
        var cityList = appContext.get_web().get_lists().getByTitle("Cities");

        var camlQuery = new SP.CamlQuery();
        camlQuery.set_viewXml("<View><RowLimit>100</RowLimit></View>");

        cityListItems = cityList.getItems(camlQuery);
        context.load(cityListItems, "Include(Title, CityID)");

        context.executeQueryAsync(onQuerySucceeded, onQueryFailed);
    }

    function onQuerySucceeded(sender, args) {
        var listItemEnumerator = cityListItems.getEnumerator();

        while (listItemEnumerator.moveNext()) {
            var listItem = listItemEnumerator.get_current();
            $("#selectCity").append($("<option>", {
                value: listItem.get_item("CityID"),
                text: listItem.get_item("Title")
            }));
        }
    }

    function onQueryFailed(sender, args) {
        alert("Request failed: " + args.get_message() + "\n" + args.get_stackTrace());
    }

    function getWeather(cityId) {
        var apiUri = weatherApiUri(cityId);
        
        $.getJSON(apiUri, function (data) {
            $("#cityName").text(data.name);
            $("#weatherConditions").text(data.weather[0].main);
            $("#weatherTemperature").text(Math.round(data.main.temp));
            $("#weatherHumidity").text(data.main.humidity);
        });
    }

    function weatherApiUri(cityId) {
        return "https://api.openweathermap.org/data/2.5/weather?id=" + cityId + "&appid=" + weatherApiAppId + "&units=metric";
    }
}

function getQueryStringParameter(paramToRetrieve) {
    var params = document.URL.split("?")[1].split("&");
    var strParams = "";
    for (var i = 0; i < params.length; i = i + 1) {
        var singleParam = params[i].split("=");
        if (singleParam[0] == paramToRetrieve)
            return singleParam[1];
    }
}