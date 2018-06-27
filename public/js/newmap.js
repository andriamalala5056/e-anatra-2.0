$(function(){
    // On va remplacer dynamiquement la latitude et longitude
    // <% @etablissement.latitude %>,<% @etablissement.longitude %>,
    var latlng = new google.maps.LatLng(-18.906551790567445, 47.51344915311279)

    var map = new google.maps.Map(document.getElementById('newmap'),{
        zoom : 10,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    // Initialisation du marker
    var marker = new google.maps.Marker({
        position : latlng,
        map : map,
        title : 'Bougez ce curseur',
        draggable : true
    });

    // Initialisation du geocoder
    var geocoder = new google.maps.Geocoder();

    google.maps.event.addListener(marker, 'drag', function(){
        setPosition(marker);
    });

    $('#address').keypress(function(e){
        if(e.keyCode == 13){
            var request = {
                address : $(this).val()
            }
            geocoder.geocode(request, function(results, status){
                if(status == google.maps.GeocoderStatus.OK){
                    var pos = results[0].geometry.location;
                    map.setCenter(pos);
                    marker.setPosition(pos);
                    setPosition(marker);
                }
            });
            return false;
        }
    });

});

function setPosition(marker){
    var pos = marker.getPosition();
    $('#latitude').val(pos.lat()); //#latitude c'est l'id du champs latitude sur le formulaire
    $('#longitude').val(pos.lng()); //#longitude c'est l'id du champs longitude sur le formulaire
};