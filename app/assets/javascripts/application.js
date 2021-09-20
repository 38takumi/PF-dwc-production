// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery
//= require moment
//= require fullcalendar

//= require popper
//= require bootstrap-sprockets



$(function () {
  $('#calendar').fullCalendar({
    selectable: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },


    locale: 'ja',
    // display business hours、土日の色分け
    businessHours: true,
    //カレンダー上部を年月で表示させる
    titleFormat: 'YYYY年 M月',
    //曜日を日本語表示
    // dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
    // カレンダーの時間表示
    // eventTimeFormat: { hour: 'numeric', minute: '2-digit' },


    //終了時刻がないイベントの表示間隔
    defaultTimedEventDuration: '03:00:00',
    buttonText: {
        prev: '前',
        next: '次',
        prevYear: '前年',
        nextYear: '翌年',
        today: '今日',
        month: '月',
        week: '週',
        day: '日'
    },
    editable: true,
    //イベントの時間表示を２４時間に
    timeFormat: "HH:mm",

    events: "/events.json",
    color: 'yellow',
    textColor: 'black',

    eventLimit: true, // イベント増えた時にリンクボタン表示
    slotEventOverlap: true, // イベントの見た目を重ねて表示
    selectHelper: true, // これをtrueにすると範囲設定できます
    selectMinDistance: 1 ,

    dayClick: function(date) {
    //   alert('clicked ' + date.format());
    },
    dayClick: function(startDate, endDate) {
      $('#new_event').modal('show');
      $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
      $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
    },
    select: function(startDate, endDate) {
      // alert('selected ' + startDate.format() + ' to ' + endDate.format());
      $('#new_event').modal('show');
      $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
      $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));


    },




  });
});


