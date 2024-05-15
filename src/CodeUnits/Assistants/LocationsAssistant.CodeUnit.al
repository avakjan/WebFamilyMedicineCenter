codeunit 50112 "Locations assistant"
{
    procedure RequestCoordinates(CountryRegion: Text; AdminDistrict: Text; Address: Text): Record "Maps Response"
    var
        _LocationsSetup: Record "Locations Setup";
        _MapsResponse: Record "Maps Response" temporary;
        _EntryNo: Integer;
        _HttpClient: HttpClient;
        _HttpResponseMessage: HttpResponseMessage;
        _ResponseText: Text;
        _JsonMessage: JsonObject;
        _JsonToken: JsonToken;
        _JsonResourceSets: JsonArray;
        _JsonResourceSet: JsonObject;
        _JsonResources: JsonArray;
        _JsonResource: JsonObject;
        _JsonAddress: JsonObject;
        _JsonCoordinates: JsonArray;
    begin
        _LocationsSetup.Get();
        _LocationsSetup.TestField("Bing Maps Locations API URL");
        _LocationsSetup.TestField("Bing Maps API Key");
        if not _HttpClient.Get(
            StrSubstNo(_LocationsSetup."Bing Maps Locations API URL",
                CountryRegion,
                AdminDistrict,
                Address,
                _LocationsSetup."Bing Maps API Key"),
            _HttpResponseMessage)
        then
            Error('GET request failed: %1', _HttpResponseMessage.ReasonPhrase);
        if not _HttpResponseMessage.IsSuccessStatusCode then
            Error(_HttpResponseMessage.ReasonPhrase);

        _HttpResponseMessage.Content.ReadAs(_ResponseText);
        _JsonMessage.ReadFrom(_ResponseText);

        _JsonMessage.Get('resourceSets', _JsonToken);
        _JsonResourceSets := _JsonToken.AsArray();
        _JsonResourceSets.Get(0, _JsonToken);
        _JsonResourceSet := _JsonToken.AsObject();
        _JsonResourceSet.Get('resources', _JsonToken);
        _JsonResources := _JsonToken.AsArray();
        for _EntryNo := 1 to _JsonResources.Count() do begin

            _JsonResources.Get(_EntryNo - 1, _JsonToken);
            _JsonResource := _JsonToken.AsObject();
            Clear(_MapsResponse);
            _MapsResponse.Init();
            _MapsResponse."Entry No." := _EntryNo;

            _JsonResource.Get('name', _JsonToken);
            _MapsResponse.Name := _JsonToken.AsValue().AsText();
            _JsonResource.Get('confidence', _JsonToken);
            _MapsResponse.Confidence := _JsonToken.AsValue().AsText();
            _JsonResource.Get('entityType', _JsonToken);
            _MapsResponse."Entity Type" := _JsonToken.AsValue().AsText();
            ;

            _JsonResource.Get('address', _JsonToken);
            _JsonAddress := _JsonToken.AsObject();
            if _JsonAddress.Get('countryRegion', _JsonToken) then
                _MapsResponse."Country Region" := _JsonToken.AsValue().AsText();
            ;
            if _JsonAddress.Get('adminDistrict', _JsonToken) then
                _MapsResponse."Admin District" := _JsonToken.AsValue().AsText();
            ;
            if _JsonAddress.Get('locality', _JsonToken) then
                _MapsResponse.Locality := _JsonToken.AsValue().AsText();
            ;

            _JsonResource.Get('point', _JsonToken);
            _JsonToken.AsObject().Get('coordinates', _JsonToken);
            _JsonCoordinates := _JsonToken.AsArray();
            _JsonCoordinates.Get(0, _JsonToken);
            _MapsResponse."Coordinates Latitude" := _JsonToken.AsValue().AsText();

            _JsonCoordinates.Get(1, _JsonToken);
            _MapsResponse."Coordinates Longitude" := _JsonToken.AsValue().AsText();

            exit(_MapsResponse);
        end;
    end;

}