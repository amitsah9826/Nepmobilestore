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
  background: linear-gradient(315deg, #ffffff 0%, #d7e1ec 2000%);
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
<style>
    
    .carousel-item>img{
        object-fit:fill !important;
    }
    #carouselExampleControls .carousel-inner{
        height: 450px;px !important;

</style>
<?php 
$brands = isset($_GET['b']) ? json_decode(urldecode($_GET['b'])) : array();
?>

<section class="py-0">
<style>
body {
    background-image: url('img_amits.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
  
}
</style>
    <div class="container-fluid">
    <div class="row">
 

        <div class="col-lg-2 px-0 border- text-sm position-sticky ">
        
        
        <center><h4><b><div class="p-1 mb-2 bg-white text-navy">Brands</div></b></h4></center>
        <marquee><a href="http://localhost/mobile_store/?b=%5B%221%22%5D"> <img src="img_ch.png" alt="Flowers in Chania" width="400" height="40"></a></marquee>
            <ul class="list-group">
                <a href="" class="list-group-item list-group-item-action">
                    
                    <div class="icheck-primary d-inline">
                        <input type="checkbox" id="brandAll" >
                        <label for="brandAll">
                             All
                        </label>
                    </div>
                </a>
                <?php 
                $qry = $conn->query("SELECT * FROM brands where status =1 order by name asc");
                while($row=$qry->fetch_assoc()):
                ?>
                <li class="list-group-item list-group-item-action">
                    <div class="icheck-navy d-inline">
                        <input type="checkbox" id="brand-item-<?php echo $row['id'] ?>" <?php echo in_array($row['id'],$brands) ? "checked" : "" ?> class="brand-item" value="<?php echo $row['id'] ?>">
                        <label for="brand-item-<?php echo $row['id'] ?>">
                                <?php echo $row['name'] ?>
                        </label>
                    </div>
                </li>
                <?php endwhile; ?>
            </ul>
            
           
            <marquee direction = "up"> <a href="https://i.ibb.co/bWYwnwW/4-copy.jpg"> <center> <img src="img_carr.png" alt="Flowers in Chania" width="190" height="250"></center></a></marquee>
           
            
            <center> <img src="img_cc.png" alt="Flowers in Chania" width="200" height="45"></center>
  
 
            </div>
            
            <div class="col-lg-10 py-1">
            <div class="row">
                <div class="col-md-12">
                <div id="tourCarousel"  class="carousel slide" data-ride="carousel" data-interval="550">
                    <div id="carouselExampleControls" class="carousel slide " data-ride="carousel">
                        <div class="carousel-inner">
                            <?php 
                                $upload_path = "uploads/banner";
                                if(is_dir(base_app.$upload_path)): 
                                $file= scandir(base_app.$upload_path);
                                $_i = 0;
                                    foreach($file as $img):
                                        if(in_array($img,array('.','..')))
                                            continue;
                                $_i++;
                                    
                            ?>
                            
                            <div class="carousel-item h-100 <?php echo $_i == 1 ? "active" : '' ?>">
                            <a href="http://localhost/mobile_store/?p=products&c=c4ca4238a0b923820dcc509a6f75849b"><img src="<?php echo validate_image($upload_path.'/'.$img) ?>" class="d-block w-100  h-100" alt="<?php echo $img ?>"></a>
                            </div>
                            <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                        <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                        </div>
                </div>
            </div>
            <div class= "container px-4 px-lg-5 mt-5">
            
                <div class="row gx-4 gx-lg-4 row-cols-md-3 row-cols-xl-4 ">
                    <?php 
                        $where = "";
                        if(count($brands)>0)
                        $where = " and p.brand_id in (".implode(",",$brands).") " ;
                        $products = $conn->query("SELECT p.*,b.name as bname FROM `products` p inner join brands b on p.brand_id = b.id where p.status = 1 {$where} order by rand() ");
                        while($row = $products->fetch_assoc()):
                            $upload_path = base_app.'/uploads/product_'.$row['id'];
                            $img = "";
                            if(is_dir($upload_path)){
                                $fileO = scandir($upload_path);
                                if(isset($fileO[2]))
                                    $img = "uploads/product_".$row['id']."/".$fileO[2];
                                // var_dump($fileO);
                            }
                            foreach($row as $k=> $v){
                                $row[$k] = trim(stripslashes($v));
                            }
                            $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
                            $inv = array();
                            while($ir = $inventory->fetch_assoc()){
                                $inv[] = number_format($ir['price']);
                            }
                    ?>
                    <div class="col mb-5">
                        <a class=" card product-item text-dark" href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                            <!-- Product image-->
                            <img class=" card-img-top" src="<?php echo validate_image($img) ?>" alt="..." />
                            <!-- Product details-->
                            <div class="btn btn-outline-success card-body p-4">
                                <div class="">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><?php echo $row['name'] ?></h5>
                                    <!-- Product price-->
                                    <?php foreach($inv as $k=> $v): ?>
                                        <span><b>Price: </b><?php echo $v ?></span>
                                    <?php endforeach; ?>
                                </div>
                                <p class="m-0"><small>Brand: <?php echo $row['bname'] ?></small></p>
                            </div>
                            
                        </a>
                        
                    </div>
                    
                    <?php endwhile; ?>
                </div>
            </div>
        </div>
    </div>
    </div>
    
</section>
<marquee direction = "up"> <center><a href="http://localhost/mobile_store/?p=view_product&id=c81e728d9d4c2f636f067f89cc14862c"><img src="img_girll.png" alt="Girl in a jacket" width="300" height="100" alt="HTML tutorial"></a></center></marquee>
<script>
    function _filter(){
        var brands = []
            $('.brand-item:checked').each(function(){
                brands.push($(this).val())
            })
        _b = JSON.stringify(brands)
        var checked = $('.brand-item:checked').length
        var total = $('.brand-item').length
        if(checked == total)
            location.href="./?";
        else
            location.href="./?b="+encodeURI(_b);
    }
    function check_filter(){
        var checked = $('.brand-item:checked').length
        var total = $('.brand-item').length
        if(checked == total){
            $('#brandAll').attr('checked',true)
        }else{
            $('#brandAll').attr('checked',false)
        }
        if('<?php echo isset($_GET['b']) ?>' == '')
            $('#brandAll,.brand-item').attr('checked',true)
    }
    $(function(){
        check_filter()
        $('#brandAll').change(function(){
            if($(this).is(':checked') == true){
                $('.brand-item').attr('checked',true)
            }else{
                $('.brand-item').attr('checked',false)
            }
            _filter()
        })
        $('.brand-item').change(function(){
            _filter()
        })
    })
    
</script>

