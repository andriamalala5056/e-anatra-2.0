# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#inscription_niveau_id').parent().hide()
    $('#inscription_vague_id').parent().hide()
    $('#inscription_filiere_id').parent().hide()
    $('#inscription_etab_id').parent().hide()
    etabs = $('#inscription_etab_id').html() #console.log(etabs)
    filieres = $('#inscription_filiere_id').html()
    vagues = $('#inscription_vague_id').html()
    niveaus = $('#inscription_niveau_id').html()
    $('#inscription_province_id').click ->
        $('#inscription_niveau_id').parent().hide()
        $('#inscription_filiere_id').parent().hide()
        $('#inscription_vague_id').parent().hide()
        province = $('#inscription_province_id :selected').text()
        escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options  = $(etabs).filter("optgroup[label='#{escaped_province}']").html()
        if options
            $('#inscription_etab_id').html(options)
            $('#inscription_etab_id').parent().show()
        else
            $('#inscription_etab_id').empty()
            $('#inscription_etab_id').parent().hide()
                

    $('#inscription_etab_id').parent().click ->
        $('#inscription_niveau_id').parent().hide()
        etab = $('#inscription_etab_id :selected').text()
        escaped_etab = etab.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options2  = $(filieres).filter("optgroup[label='#{escaped_etab}']").html()
        @splt = options2.split("\n")
        tab_filiere = new Array()
        i=0
        for scale in [@splt.length..0]
            if !(tab_filiere.includes(@splt[i]))
                tab_filiere.push(@splt[i])
                i += 1
        ens=tab_filiere.join()
        option2 = ens.replace(",","\n")
        optionsVague = $(vagues).filter("optgroup[label='#{escaped_etab}']").html()
        if options2
            $('#inscription_filiere_id').html(option2)
            $('#inscription_filiere_id').parent().show()
            $('#inscription_vague_id').html(optionsVague)
            $('#inscription_vague_id').parent().show()
        else
            $('#inscription_filiere_id').empty()
            $('#inscription_filiere_id').parent().hide()
            $('#inscription_vague_id').empty()
            $('#inscription_vague_id').parent().hide()
            
    #clic filiere
    $('#inscription_filiere_id').click ->
        filiere = $('#inscription_filiere_id :selected').text()
        escaped_filiere = filiere.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options3  = $(niveaus).filter("optgroup[label='#{escaped_filiere}']").html()
        @splt3 = options3.split("\n")
        tab_niveau = new Array()
        j=0
        for scale in [@splt3.length..0]
            if !(tab_niveau.includes(@splt3[j]))
                tab_niveau.push(@splt3[j])
                j += 1
        ens3=tab_niveau.join()
        option3 = ens3.replace(",","\n")
        #optionsVague3 = $(vagues).filter("optgroup[label='#{escaped_etab}']").html()
        if options3
            $('#inscription_niveau_id').html(option3)
            $('#inscription_niveau_id').parent().show()
            #$('#inscription_vague_id').html(optionsVague)
            #$('#inscription_vague_id').parent().show()
        else
            $('#inscription_niveau_id').empty()
            $('#inscription_niveau_id').parent().hide()
            #$('#inscription_vague_id').empty()
            #$('#inscription_vague_id').parent().hide()