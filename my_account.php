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
  background: linear-gradient(, #ffffff 0%, #d7e1ec 70%);
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
<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body">
                <div class="w-100 justify-content-between d-flex">
                    <h4><b>Orders</b></h4>
                    <a href="./?p=edit_account" class="btn btn btn-default btn-rounded bg-navy"><div class="fa fa-user-cog"></div> Manage Account</a>
                </div>
                    <hr class="border-warning">
                    <table class="table table-stripped text-navy">
                        <colgroup>
                            <col width="10%">
                            <col width="15">
                            <col width="25">
                            <col width="25">
                            <col width="15">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>DateTime</th>
                                <th>Transaction ID</th>
                                <th>Amount</th>
                                <th>Order Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $i = 1;
                                $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id where o.client_id = '".$_settings->userdata('id')."' order by unix_timestamp(o.date_created) desc ");
                                while($row = $qry->fetch_assoc()):
                            ?>
                                <tr>
                                    <td><?php echo $i++ ?></td>
                                    <td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
                                    <td><a href="javascript:void(0)" class="view_order" data-id="<?php echo $row['id'] ?>"><?php echo md5($row['id']); ?></a></td>
                                    <td><?php echo number_format($row['amount']) ?> </td>
                                    <td class="text-center">
                                            <?php if($row['status'] == 0): ?>
                                                <span class="badge badge-light text-dark">Pending</span>
                                            <?php elseif($row['status'] == 1): ?>
                                                <span class="badge badge-primary">Packed</span>
                                            <?php elseif($row['status'] == 2): ?>
                                                <span class="badge badge-warning">Out for Delivery</span>
                                            <?php elseif($row['status'] == 3): ?>
                                                <span class="badge badge-success">Delivered</span>
                                            <?php else: ?>
                                                <span class="badge badge-danger">Cancelled</span>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                            <?php endwhile; ?>
                        </body>
                    </table>
            </div>
        </div>
    </div>
</section>
<script>
    function cancel_book($id){
        start_loader()
        $.ajax({
            url:_base_url_+"classes/Master.php?f=update_book_status",
            method:"POST",
            data:{id:$id,status:2},
            dataType:"json",
            error:err=>{
                console.log(err)
                alert_toast("an error occured",'error')
                end_loader()
            },
            success:function(resp){
                if(typeof resp == 'object' && resp.status == 'success'){
                    alert_toast("Book cancelled successfully",'success')
                    setTimeout(function(){
                        location.reload()
                    },2000)
                }else{
                    console.log(resp)
                    alert_toast("an error occured",'error')
                }
                end_loader()
            }
        })
    }
    $(function(){
        $('.view_order').click(function(){
            uni_modal("Order Details","./admin/orders/view_order.php?view=user&id="+$(this).attr('data-id'),'large')
        })
        $('table').dataTable();

    })
</script>