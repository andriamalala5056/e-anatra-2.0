$(function(){
    // On va remplacer dynamiquement la latitude et longitude
    // <% @etablissement.latitude %>,<% @etablissement.longitude %>,
    var latlng = new google.maps.LatLng(-18.90910, 47.52857)

    var map = new google.maps.Map(document.getElementById('showmap'),{
        zoom : 10,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    // Initialisation du marker
    var marker = new google.maps.Marker({
        position : latlng,
        map : map,
        title : 'Bougez ce curseur',
        draggable : false
    });

    // Initialisation du geocoder
    var geocoder = new google.maps.Geocoder();

    google.maps.event.addListener(marker, 'drag', function(){
        setPosition(marker);
    });

    $('#adresse').keypress(function(e){
        if(e.keyCode == 13){
            var request = {
                address : $(this).val()
            }
            geocoder.geocode(request, function(results, status){
                if(status == google.maps.GeocoderStatus.OK){
                    map.setCenter(results[0].geometry.location);
                }
            });
            return false;
        }
    });

});

function setPosition(marker){
    var pos = marker.getPosition();
    $('#lat').val(pos.lat());
    $('#lng').val(pos.lng());
};