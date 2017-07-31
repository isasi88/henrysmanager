// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require Chart.bundle
//= require chartkick
//= require best_in_place
//= require jquery.purr
//= require turbolinks

//= require_tree .


  $('.best_in_place').best_in_place();


$(document).ready(function(){
table = $('#clientes').DataTable();
table.destroy();
$('#clientes').DataTable({
    language: {
        processing:     "Procesando...",
        search:         "Buscar&nbsp;:",
        lengthMenu:    "Mostrar _MENU_ elementos",
        info:           "Mostrando _START_ a _END_ de _TOTAL_ elementos",
        infoEmpty:      "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
        infoFiltered:   "(filtrados de _MAX_ elementos del total)",
        infoPostFix:    "",
        loadingRecords: "Cargando...",
        zeroRecords:    "No hay datos",
        emptyTable:     "No hay datos",
        paginate: {
            first:      "Primero",
            previous:   "Anterior",
            next:       "Siguiente",
            last:       "Ultimo"
        },
        aria: {
            sortAscending:  ": activer pour trier la colonne par ordre croissant",
            sortDescending: ": activer pour trier la colonne par ordre décroissant"
    }
	}
	});
  });