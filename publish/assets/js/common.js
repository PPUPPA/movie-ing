
$(function(){
  // GNB
  isGnbExpand();

  $(".gnb .gnb__item").on("mouseover focusin", function(){
    $(this).addClass("is-active");
    isGnbExpand();
  });

  $(".gnb .gnb__item").on("mouseout focusout", function(){
    $(this).removeClass("is-active");
    isGnbExpand();
  });

  // main visual
  $(".as_main-visual__video-wrap").on("mouseover", function(){
    $(this).addClass("is-play");
    $(".as_main-visual__img").stop().hide();
    $(".as_main-visual__video").get(0).play();
  });
  $(".as_main-visual__video-wrap").on("mouseout", function(){
    $(this).removeClass("is-play");
    $(".as_main-visual__img").stop().show();
    $(".as_main-visual__video").get(0).pause();
    $(".as_main-visual__video").get(0).currentTime = 0;
  });

  // SRCH INPUT
  $(".board-head .srch-box .btn-del").click(function(){
		$(this).prev(".inp").val("");
		$(this).hide();
		$(this).next(".btn-srch").click();
	});

	$(".board-head .srch-box .inp").on("input", function(){
		if($(this).val() == ""){
			$(this).siblings(".btn-del").hide();
		}else{
			$(this).siblings(".btn-del").show();
		}
	});
});

// function
function isGnbExpand(){
  let isGnbExpand = $("button.gnb__link").parents(".gnb__item").hasClass("is-active");

  if(isGnbExpand) {
    $(".gnb").addClass("is-expand");
  } else {
    $(".gnb").removeClass("is-expand");
  };
}