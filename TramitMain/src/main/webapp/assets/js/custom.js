jQuery( document ).ready(function( $ ) {

    "use strict";

    // jQuery UI tabs 기능 활성화
    $(function() {
        $( "#tabs" ).tabs();
    });
    


    // 페이지 로딩 애니메이션
    $("#preloader").animate({
        'opacity': '0' // preloader의 투명도를 0으로 변경 (점점 사라지게 함)
    }, 600, function(){ // 600ms 동안 애니메이션 실행 후 콜백 함수 실행
        setTimeout(function(){
            $("#preloader").css("visibility", "hidden").fadeOut(); // 300ms 후 preloader를 숨기고 fadeOut 애니메이션 적용
        }, 300);
    });


    // 윈도우 스크롤 이벤트 핸들러
    $(window).scroll(function() {
        var scroll = $(window).scrollTop(); // 현재 스크롤된 위치를 가져옴
        var box = $('.header-text').height(); // .header-text 요소의 높이를 가져옴
        var header = $('header').height(); // <header> 요소의 높이를 가져옴

        // 스크롤 위치가 .header-text의 하단에서 <header>의 높이만큼 올라온 지점보다 크거나 같으면
        if (scroll >= box - header) {
            $("header").addClass("background-header"); // <header>에 "background-header" 클래스를 추가하여 배경색을 변경
        } else {
            $("header").removeClass("background-header"); // 스크롤 위치가 이전보다 위로 올라가면 "background-header" 클래스를 제거
        }
    });

    // .owl-clients 요소가 존재하면 Owl Carousel 슬라이더 초기화
    if ($('.owl-clients').length) {
        $('.owl-clients').owlCarousel({
            loop: true, // 슬라이드 순환 활성화
            nav: false, // 이전/다음 버튼 비활성화
            dots: true, // 페이지네이션 활성화
            items: 1, // 기본적으로 한 번에 1개의 아이템 표시
            margin: 30, // 아이템 간의 간격
            autoplay: false, // 자동 슬라이드 비활성화
            smartSpeed: 700, // 슬라이드 속도
            autoplayTimeout: 6000, // 자동 슬라이드 간격
            responsive: { // 반응형 설정
                0: { // 0px 이상
                    items: 1,
                    margin: 0
                },
                460: { // 460px 이상
                    items: 1,
                    margin: 0
                },
                576: { // 576px 이상
                    items: 3,
                    margin: 20
                },
                992: { // 992px 이상
                    items: 5,
                    margin: 30
                }
            }
        });
    }

    // .owl-testimonials 요소가 존재하면 Owl Carousel 슬라이더 초기화 (고객 후기용)
    if ($('.owl-testimonials').length) {
        $('.owl-testimonials').owlCarousel({
            loop: true,
            nav: false,
            dots: true,
            items: 1,
            margin: 30,
            autoplay: false,
            smartSpeed: 700,
            autoplayTimeout: 6000,
            responsive: {
                0: {
                    items: 1,
                    margin: 0
                },
                460: {
                    items: 1,
                    margin: 0
                },
                576: {
                    items: 2,
                    margin: 20
                },
                992: {
                    items: 2,
                    margin: 30
                }
            }
        });
    }

    // .owl-banner 요소가 존재하면 Owl Carousel 슬라이더 초기화 (배너용)
    if ($('.owl-banner').length) {
        $('.owl-banner').owlCarousel({
            loop: true,
            nav: false,
            dots: true,
            items: 1,
            margin: 0,
            autoplay: false,
            smartSpeed: 700,
            autoplayTimeout: 6000,
            responsive: {
                0: {
                    items: 1,
                    margin: 0
                },
                460: {
                    items: 1,
                    margin: 0
                },
                576: {
                    items: 1,
                    margin: 20
                },
                992: {
                    items: 1,
                    margin: 30
                }
            }
        });
    }

    // .Modern-Slider 요소가 존재하면 Slick 슬라이더 초기화
    $(".Modern-Slider").slick({
        autoplay:true, // 자동 슬라이드 활성화
        autoplaySpeed:10000, // 자동 슬라이드 간격 (10초)
        speed:600, // 슬라이드 전환 속도
        slidesToShow:1, // 한 번에 보여지는 슬라이드 수
        slidesToScroll:1, // 한 번에 스크롤되는 슬라이드 수
        pauseOnHover:false, // 마우스 호버 시 자동 슬라이드 멈춤 비활성화
        dots:true, // 페이지네이션 활성화
        pauseOnDotsHover:true, // 페이지네이션 호버 시 자동 슬라이드 멈춤 활성화
        cssEase:'linear', // CSS easing 효과
        // fade:true, // 페이드 효과 (주석 처리됨)
        draggable:false, // 드래그하여 슬라이드 이동 비활성화
        prevArrow:'<button class="PrevArrow"></button>', // 이전 화살표 버튼 HTML
        nextArrow:'<button class="NextArrow"></button>', // 다음 화살표 버튼 HTML
    });

    // .filters ul li 요소 클릭 이벤트 핸들러 (필터링 기능)
    $('.filters ul li').click(function(){
        $('.filters ul li').removeClass('active'); // 모든 필터 버튼에서 "active" 클래스 제거
        $(this).addClass('active'); // 클릭된 필터 버튼에 "active" 클래스 추가

        var data = $(this).attr('data-filter'); // 클릭된 필터 버튼의 "data-filter" 속성 값 가져오기
        $grid.isotope({ // Isotope 레이아웃 플러그인으로 필터링 적용
            filter: data
        })
    });

    // .grid 요소에 Isotope 레이아웃 플러그인 초기화
    var $grid = $(".grid").isotope({
        itemSelector: ".all", // 필터링될 아이템 클래스
        percentPosition: true, // 퍼센트 기반 위치 설정
        masonry: { // Masonry 레이아웃 설정 (벽돌 쌓기 형태)
            columnWidth: ".all" // 각 컬럼의 너비
        }
    });

    // .accordion > li의 첫 번째 <a> 태그에 "active" 클래스 추가하고 다음 .content 요소 슬라이드 다운
    $('.accordion > li:eq(0) a').addClass('active').next().slideDown();

    // .accordion <a> 태그 클릭 이벤트 핸들러 (아코디언 기능)
    $('.accordion a').click(function(j) {
        var dropDown = $(this).closest('li').find('.content'); // 클릭된 <a> 태그의 가장 가까운 <li> 요소의 .content 요소 찾기

        // 현재 클릭된 아코디언 항목 외의 다른 열린 .content 요소 슬라이드 업
        $(this).closest('.accordion').find('.content').not(dropDown).slideUp();

        // 클릭된 <a> 태그에 "active" 클래스가 있으면 제거하고, 없으면 다른 "active" 클래스를 제거하고 자신에게 추가
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        } else {
            $(this).closest('.accordion').find('a.active').removeClass('active');
            $(this).addClass('active');
        }

        // 클릭된 .content 요소 슬라이드 토글 (보이거나 숨김)
        dropDown.stop(false, true).slideToggle();

        j.preventDefault(); // 기본 링크 동작 방지
    });
    

});




