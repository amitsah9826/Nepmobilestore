<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {

}

#myBta {
  font-family: 'Poppins', sans-serif;
 
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  
}


}
</style>
</head>
<body>

<button type="button" class="btn btn-warning" onclick="topFunction()" id="myBta" title="Go to top">Top</button>


<script>
// Get the button
let mybutton = document.getElementById("myBta");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>

</body>
</html>

<?php 
 $products = $conn->query("SELECT p.*,b.name as bname FROM `products` p inner join brands b on p.brand_id = b.id where md5(p.id) = '{$_GET['id']}' ");
 if($products->num_rows > 0){
     foreach($products->fetch_assoc() as $k => $v){
         $$k= stripslashes($v);
     }
    $upload_path = base_app.'/uploads/product_'.$id;
    $img = "";
    if(is_dir($upload_path)){
        $fileO = scandir($upload_path);
        if(isset($fileO[2]))
            $img = "uploads/product_".$id."/".$fileO[2];
        // var_dump($fileO);
    }
    $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$id);
    $inv = array();
    while($ir = $inventory->fetch_assoc()){
        $inv[] = $ir;
    }
 }
?>
     <div class="card">
                <div class="card-body">
<section class="py-4">
    <div class="container px-4 px-lg-1 my-1">
        
        <div class="row gx-4 gx-lg-5 align-items-row">
            <div class="col-md-4">
                <img class="card-img-top mb-5 mb-md-0  border-dark" loading="lazy" id="display-img" src="<?php echo validate_image($img) ?>" alt="..." />
                <div class="mt-2 row gx-2 gx-lg-3 row-cols-4 row-cols-md-3 row-cols-xl-4 justify-content-start">
                    <?php 
                        foreach($fileO as $k => $img):
                            if(in_array($img,array('.','..')))
                                continue;
                    ?>
                    <div class="col">
                        <a href="javascript:void(0)" class="view-image <?php echo $k == 2 ? "active":'' ?>"><img src="<?php echo validate_image('uploads/product_'.$id.'/'.$img) ?>" loading="lazy"  class="img-thumbnail" alt=""></a>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>
            
            <div class="col-md-7">
            <section class="py-5">

                <!-- <div class="small mb-1">SKU: BST-498</div> -->
                <div class="col-md-18 grid-margin stretch-card">
                <div class="shadow-lg p-3 mb-5 bg-white rounded">
                <h1 class="display-4 fw-bolder border-bottom border-primary pb-1"><?php echo $name ?></h1>
                
                
              
                <p class="m-0"><small>Brand: <?php echo $bname ?></small></p>
                <div class="fs-3 mb-1">
                <h2><p><b><FONT COLOR="#ff0000">  रू. <span id="price"><?php echo number_format($inv[0]['price']) ?></span></b></FONT>
                <br>
                <form action="" id="add-cart">
                <div class="d-flex">
                    <input type="hidden" name="price" value="<?php echo $inv[0]['price'] ?>">
                    <input type="hidden" name="inventory_id" value="<?php echo $inv[0]['id'] ?>">
                    <input class="form-control text-center me-2" id="inputQuantity" type="num" value="1" style="max-width: 3rem" name="quantity" />
                    <button class="btn btn-success flex-shrink-0" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Add to cart
                    </button>
                    
                </div>
                <span><small>Available Stock: <span id="avail"><?php echo $inv[0]['quantity'] ?></span></small></span>
                </div>
                </div>
                
                </form>
                        </div>
                        <span class="social-label">Share Friends :</span>
                        <!DOCTYPE html>
                        
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
   <head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
html,body{
  display: center;
  height: 100%;
  width: 100%;
  place-items: center;
  background: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
}
.wrapper{
  display: inline-flex;
}
.wrapper .icon{
  margin: 0 20px;
  text-align: center;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  position: relative;
  z-index: 2;
  transition: 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}
.wrapper .icon span{
  display: block;
  height: 60px;
  width: 60px;
  background: #fff;
  border-radius: 50%;
  position: relative;
  z-index: 2;
  box-shadow: 0px 10px 10px rgba(0,0,0,0.1);
  transition: 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}
.wrapper .icon span i{
  line-height: 60px;
  font-size: 25px;
}
.wrapper .icon .tooltip{
  position: absolute;
  top: 0;
  z-index: 1;
  background: #fff;
  color: #fff;
  padding: 10px 18px;
  font-size: 20px;
  font-weight: 500;
  border-radius: 25px;
  opacity: 0;
  pointer-events: none;
  box-shadow: 0px 10px 10px rgba(0,0,0,0.1);
  transition: 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}
.wrapper .icon:hover .tooltip{
  top: -70px;
  opacity: 1;
  pointer-events: auto;
}
.icon .tooltip:before{
  position: absolute;
  content: "";
  height: 15px;
  width: 15px;
  background: #fff;
  left: 50%;
  bottom: -6px;
  transform: translateX(-50%) rotate(45deg);
  transition: 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}
.wrapper .icon:hover span{
  color: #fff;
}
.wrapper .icon:hover span,
.wrapper .icon:hover .tooltip{
  text-shadow: 0px -1px 0px rgba(0,0,0,0.4);
}
.wrapper .facebook:hover span,
.wrapper .facebook:hover .tooltip,
.wrapper .facebook:hover .tooltip:before{
  background: #3B5999;
}
.wrapper .twitter:hover span,
.wrapper .twitter:hover .tooltip,
.wrapper .twitter:hover .tooltip:before{
  background: #46C1F6;
}
.wrapper .instagram:hover span,
.wrapper .instagram:hover .tooltip,
.wrapper .instagram:hover .tooltip:before{
  background: #e1306c;
}
.wrapper .github:hover span,
.wrapper .github:hover .tooltip,
.wrapper .github:hover .tooltip:before{
  background: #333;
}
.wrapper .youtube:hover span,
.wrapper .youtube:hover .tooltip,
.wrapper .youtube:hover .tooltip:before{
  background: #DE463B;
}
</style>
      <meta charset="utf-8">
      
      <link rel="stylesheet" href="style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
   </head>
   <body>
      <div class="wrapper">
         <div class="icon facebook">
            <div class="tooltip">
               Facebook
               
            </div>
            
            <a href="https://www.facebook.com/nayan.sah.3133"><span><i class="fab fa-facebook-f"></i></span></a>
         </div>
         <div class="icon twitter">
            <div class="tooltip">
               Twitter
            </div>
            <a href="https://twitter.com/">   <span><i class="fab fa-twitter"></i></span></a>
         </div>
         <div class="icon instagram">
            <div class="tooltip">
               Instagram
            </div>
            <a href="https://www.instagram.com/aridnam07/">  <span><i class="fab fa-instagram"></i></span></a>
         </div>
         <div class="icon github">
            <div class="tooltip">
               Github
            </div>
            <a href="https://github.com/summernote/summernote/issues"> <span><i class="fab fa-github"></i></span></a>
         </div>
         <div class="icon youtube">
            <div class="tooltip">
               YouTube
            </div>
            <a href="https://www.youtube.com/@china_loves_India">  <span><i class="fab fa-youtube"></i></span></a>
            
         </div>
         
      </div>
      <html>
                    
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#more {display: none;}
</style>
</head>
<body>
    
<section class="py-3">
<center><p><b><h2>Product Specification</h2></b></p></center>
<span id="dots"></span><span id="more">  <p class="lead"><?php echo stripslashes(html_entity_decode($specs)) ?></p></span></p>

<center><button class="btn btn-outline-secondary""button" onclick="myFunction()" id="myBtn">Read more</button></center>
   </body>
</html>
</div>

                 
                                      
                
                
 

                   <script>
function myFunction() {
  var dots = document.getElementById("dots");
  var moreText = document.getElementById("more");
  var btnText = document.getElementById("myBtn");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Read more"; 
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Read less"; 
    moreText.style.display = "inline";
  }
}
</script>

</body>
</html>
                
            </div>
        </div>
    </div>
    
</section>
<!-- Related items section-->
<!-- Section: Design Block -->
<section class="text-center">
  <!-- Background image -->
  <div class="p-5 bg-image" style="
        background-image: url('https://i.ibb.co/xDPN22G/png2.png');
        height: 200px;
        "></div>
  <!-- Background image -->

  <div class="card mx-4 mx-md-5 shadow-5-strong" style="
        margin-top: -100px;
        background: hsla(0, 0%, 100%, 0.8);
        backdrop-filter: blur(20px);
        "
        
        <section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="fw-bolder mb-4">Related products</h2>
        <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <?php 
            $products = $conn->query("SELECT p.*,b.name as bname FROM `products` p inner join brands b on p.brand_id = b.id where p.status = 1 and (p.category_id = '{$category_id}' or p.sub_category_id = '{$sub_category_id}') and p.id !='{$id}' order by rand() limit 4 ");
            while($row = $products->fetch_assoc()):
                $upload_path = base_app.'/uploads/product_'.$row['id'];
                $img = "";
                if(is_dir($upload_path)){
                    $fileO = scandir($upload_path);
                    if(isset($fileO[2]))
                        $img = "uploads/product_".$row['id']."/".$fileO[2];
                    // var_dump($fileO);
                }
                $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
                $_inv = array();
                foreach($row as $k=> $v){
                    $row[$k] = trim(stripslashes($v));
                }
                while($ir = $inventory->fetch_assoc()){
                    $_inv[] = number_format($ir['price']);
                }
        ?>
            <div class="col mb-5">
                <a class="card h-100 product-item text-dark" href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                    <!-- Product image-->
                    <img class="card-img-top w-100" src="<?php echo validate_image($img) ?>" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><?php echo $row['name'] ?></h5>
                            <!-- Product price-->
                            <?php foreach($_inv as $k=> $v): ?>
                                <span><b>Price: </b><?php echo $v ?></span>
                            <?php endforeach; ?>
                            <p class="m-0"><small>Brand: <?php echo $row['bname'] ?></small></p>
                        </div>
                    </div>
                </a>
            </div>
            <?php endwhile; ?>
        </div>
    </div>
    </section>
<script>
    var inv = $.parseJSON('<?php echo json_encode($inv) ?>');
    $(function(){
        $('.view-image').click(function(){
            var _img = $(this).find('img').attr('src');
            $('#display-img').attr('src',_img);
            $('.view-image').removeClass("active")
            $(this).addClass("active")
        })
        $('.p-size').click(function(){
            var k = $(this).attr('data-id');
            $('.p-size').removeClass("active")
            $(this).addClass("active")
            $('#price').text(inv[k].price)
            $('[name="price"]').val(inv[k].price)
            $('#avail').text(inv[k].quantity)
            $('[name="inventory_id"]').val(inv[k].id)

        })

        $('#add-cart').submit(function(e){
            e.preventDefault();
            if('<?php echo $_settings->userdata('id') ?>' <= 0){
                uni_modal("","login.php");
                return false;
            }
            start_loader();
            $.ajax({
                url:'classes/Master.php?f=add_to_cart',
                data:$(this).serialize(),
                method:'POST',
                dataType:"json",
                error:err=>{
                    console.log(err)
                    alert_toast("an error occured",'error')
                    end_loader()
                },
                success:function(resp){
                    if(typeof resp == 'object' && resp.status=='success'){
                        alert_toast("Product added to cart.",'success')
                        $('#cart-count').text(resp.cart_count)
                    }else{
                        console.log(resp)
                        alert_toast("an error occured",'error')
                    }
                    end_loader();
                }
            })
        })
    })
</script>
</div>