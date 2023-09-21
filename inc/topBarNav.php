
      <nav class="navbar navbar-expand-lg navbar-dark bg-navy">
            <div class="container-fluid px-4 px-lg-2 ">
                <button class="navbar-toggler btn btn-sm" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <a class="navbar-brand" href="./">
                <img src="<?php echo validate_image($_settings->info('logo')) ?>" width="165" height="53" class="d-inline-block align-top" alt="" loading="lazy">
                <?php echo $_settings->info('short_name') ?>
                </a>

                <form class="form-inline" id="search-form">
                  <div class="input-group">
                    <input class="form-control form-control-lg-5 form " type="search" placeholder="Search" aria-label="Search" name="search"  value="<?php echo isset($_GET['search']) ? $_GET['search'] : "" ?>"  aria-describedby="button-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-outline-light btn-lg-5 m-0" type="submit" id="button-addon2"><i class="fa fa-search"></i></button>
                    </div>
                  </div>
                </form>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-2">
                        <li class="nav-item"><a class="nav-link text-white" aria-current="page" href="./">Home</a></li>
                        <?php 
                        $cat_qry = $conn->query("SELECT * FROM categories where status = 1  limit 3");
                        $count_cats =$conn->query("SELECT * FROM categories where status = 1 ")->num_rows;
                        while($crow = $cat_qry->fetch_assoc()):
                          $sub_qry = $conn->query("SELECT * FROM sub_categories where status = 1 and parent_id = '{$crow['id']}'");
                          if($sub_qry->num_rows <= 0):
                        ?>
                        <li class="nav-item"><a class="nav-link text-white" aria-current="page" href="./?p=products&c=<?php echo md5($crow['id']) ?>"><?php echo $crow['category'] ?></a></li>
                        
                        <?php else: ?>
                        <li class="nav-item dropdown">
                          <a class="nav-link text-white dropdown-toggle" id="navbarDropdown<?php echo $crow['id'] ?>" href="#" role="button" data-toggle="dropdown" aria-expanded="false"><?php echo $crow['category'] ?></a></a>
                            <ul class="dropdown-menu  p-0" aria-labelledby="navbarDropdown<?php echo $crow['id'] ?>">
                              <?php while($srow = $sub_qry->fetch_assoc()): ?>
                                <li><a class="dropdown-item border-bottom" href="./?p=products&c=<?php echo md5($crow['id']) ?>&s=<?php echo md5($srow['id']) ?>"><?php echo $srow['sub_category'] ?></a></li>
                            <?php endwhile; ?>
                            </ul>
                        </li>
                        <?php endif; ?>
                        <?php endwhile; ?>
                        <?php if($count_cats > 3): ?>
                        <li class="nav-item"><a class="nav-link text-white" href="./?p=view_categories">All Categories</a></li>
                        <?php endif; ?>
                        <li class="nav-item"><a class="nav-link text-white" href="./?p=about">About</a></li>
                        
                        
                    </ul><div class="d-flex align-items-center">
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img_first.png" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img_secod.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img_third.png" alt="Third slide">
    </div>
  </div>
</div>
                    
                    
                      <?php if(!isset($_SESSION['userdata']['id'])): ?>
                        <!DOCTYPE html>

                        
                        <html>
                          
                          
<head>
<style>
.button {
  padding: 8px 20px;
  font-size: 20px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: black;
  background-color: white;
  border: none;
  border-radius: 25px;
  box-shadow: 0 0px #FFFFFF;
}

.button:hover {background-color: #ffee00}

.button:active {
  background-color: #00FF00;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>

<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "//hm.baidu.com/hm.js?73c27e26f610eb3c9f3feb0c75b03925";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
  



<button class="button" id="login-btn" type="button">Login</button>

</body>
</html>
                        <?php else: ?>
                        <a class="text-white mr-2 nav-link text-light" href="./?p=cart">
                            <i class="bi-cart-fill me-1"></i>
                            <img src="img_chania.png" alt="Flowers in Chania" width="25" height="25">
                            <span class="badge bg-warning text-black ms-1 rounded-pill" id="cart-count">
                              <?php 
                              if(isset($_SESSION['userdata']['id'])):
                                $count = $conn->query("SELECT SUM(quantity) as items from `cart` where client_id =".$_settings->userdata('id'))->fetch_assoc()['items'];
                                echo ($count > 0 ? $count : 0);
                              else:
                                echo "0";
                              endif;
                              ?>
                            </span>
                        </a>
                        
                            <a href="./?p=my_account" class="text-light  nav-link text-white"><b> Hi, <?php echo $_settings->userdata('firstname')?>!</b></a>
                            <a href="logout.php" class="btn btn-danger"><i class="fa fa-sign-out-alt"></i></a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </nav>
<script>
  $(function(){
    $('#login-btn').click(function(){
      uni_modal("","login.php")
    })
    $('#navbarResponsive').on('show.bs.collapse', function () {
        $('#mainNav').addClass('navbar-shrink')
    })
    $('#navbarResponsive').on('hidden.bs.collapse', function () {
        if($('body').offset.top == 0)
          $('#mainNav').removeClass('navbar-shrink')
    })
  })

  $('#search-form').submit(function(e){
    e.preventDefault()
     var sTxt = $('[name="search"]').val()
     if(sTxt != '')
      location.href = './?p=products&search='+sTxt;
  })
</script>