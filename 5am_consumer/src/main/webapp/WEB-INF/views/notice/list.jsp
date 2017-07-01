<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!--banner-->
<div class="banner-top">
	<div class="container">
		<h3 >Notice</h3>
		<h4><a href="index.html">Home</a><label>/</label>Notice</h4>
		<div class="clearfix"> </div>
	</div>
</div>

<!-- contact -->
<div class="contact">
	<div class="container">
		<!--- terms ---->
		<div class="terms">
			<div class="container">

				<div class="spec ">
					<h3>Notice</h3>
					<div class="ser-t">
						<b></b> <span><i></i></span> <b class="line"></b>
					</div>
				</div>
				
				<div class="panel panel-default">
						<div class="panel-heading">
							 <h6 class="panel-title"  data-toggle="collapse" data-target="#cusregi">
								 <span style="color:highlighttext;font-weight: bold;">공지사항 등록하기</span>  
							 </h6>
							
						</div>
						
						<div id="cusregi" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1">제목</span>
								  <input id="custitle" type="text" class="form-control" placeholder="제목을 입력하세요..." aria-describedby="basic-addon1">
								</div>
								
								
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1">내용</span>
								  <textarea id="cuscontent" style="height: 400px" type="text" class="form-control" placeholder="내용을 입력하세요..." aria-describedby="basic-addon1"></textarea>
								</div>
								
								<h2 class="t-button" style="text-align: right;">
							    <a id="registerBtn" href="#"><span class="label label-info" >등록하기</span></a>
							    </h2>
								
							</div>
						</div>
					</div>
				

					<div id="showList"></div>


			

			</div>
		</div>
		<!--- /terms ---->

	</div>

</div>

<!-- //contact -->

   



<!--footer-->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- //footer-->
<!-- tabs -->
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
			type: 'default', //Types: default, vertical, accordion           
			width: 'auto', //auto or any width like 600px
			fit: true   // 100% fit in a container
			});
		});				
	</script>
<!-- //tabs -->
<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
								
		$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->
<!-- for bootstrap working -->
		<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<script type='text/javascript' src="js/jquery.mycart.js"></script>
 <script type="text/javascript">
  $(function () {

    var goToCartIcon = function($addTocartBtn){
      var $cartIcon = $(".my-cart-icon");
      var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
      $addTocartBtn.prepend($image);
      var position = $cartIcon.position();
      $image.animate({
        top: position.top,
        left: position.left
      }, 500 , "linear", function() {
        $image.remove();
      });
    }

    $('.my-cart-btn').myCart({
      classCartIcon: 'my-cart-icon',
      classCartBadge: 'my-cart-badge',
      affixCartIcon: true,
      checkoutCart: function(products) {
        $.each(products, function(){
          console.log(this);
        });
      },
      clickOnAddToCart: function($addTocart){
        goToCartIcon($addTocart);
      },
      getDiscountPrice: function(products) {
        var total = 0;
        $.each(products, function(){
          total += this.quantity * this.price;
        });
        return total * 1;
      }
    });

  });
  </script>
  
<script type="text/javascript">
$(document).ready(function() {

	function nlist(){
		
		 $.ajax({
		        type: "POST",
		        url: "/notice/list",
		        data : {
		        	page : "1"
		        },
		 		dataType: 'Json',
		        success: function(re) {
		           console.log(re);
		           
		           adlist(re);
		        }
		    });
		
		
	}
	
	nlist();
	
	var str="";

	 function adlist(list){			 	
		 				 
		 $.each(list, function(index, value) {
			 console.log(index);  
			 console.log(value.title);
			 
			 
			 str+='<div class="ter-wthree">'
				+'<h6><span>'+value.tno+'. </span> '+value.title+'</h6>'
				+'<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.</p>'
				+'<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. </p>'
				+'<p> Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance</p>'
			+'</div>'
			 
			}); 
		 
		
		 	$("#showList").append(str);
		 	
		 			 
		 
	}
	 
	 $("#registerBtn").on("click",function(e){
		 
		 e.preventDefault();
	
		 console.log("공지사항 등록 시작")
	 
		
		 var title = $('#custitle').val();
		 var content = $('#cuscontent').val();
		 
		 $.ajax({
		        type: "POST",
		        url: "/notice/register",
		        
		        data : {
		        	title : title,
		        	content : content
		        },
		 		dataType: 'Json',
		        success: function(re) {
		           console.log(re);
		           adlist(re);
		           window.location = '/notice/list';
		        }
		    });
		 
		 
		 
	 })
	 
	

	
	
})
</script>
  
</body>
</html>