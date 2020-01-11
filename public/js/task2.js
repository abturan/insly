
            // Java Script 
            var slider_est = document.getElementById("estimated");
            var output_est = document.getElementById("estimated_show");
            output_est.innerHTML = slider_est.value;
            

            slider_est.oninput = function() {
            output_est.innerHTML = this.value;
            }


            var slider_ins = document.getElementById("instalments");
            var output_ins = document.getElementById("instalments_show");
            output_ins.innerHTML = slider_ins.value;

            slider_ins.oninput = function() {
            output_ins.innerHTML = this.value;
            }
          


            var slider_tax = document.getElementById("tax");
            var output_tax = document.getElementById("tax_show");
            output_tax.innerHTML = slider_tax.value;

            slider_tax.oninput = function() {
            output_tax.innerHTML = this.value;
            }

           
            
            
            // jQuery 
            $("#estimated").change(function(){
                $("#estimated_input").val(slider_est.value);
            });

            $("#estimated_input").on("change paste keyup", function() {
                $("#estimated").val($("#estimated_input").val());
                $("#estimated_show").html($("#estimated_input").val());
            });


            $("#instalments").change(function(){
                $("#instalments_input").val(slider_ins.value);
            });

            $("#instalments_input").on("change paste keyup", function() {
                $("#instalments").val($("#instalments_input").val());
                $("#instalments_show").html($("#instalments_input").val());
            });


            $("#tax").change(function(){
                $("#tax_input").val(slider_tax.value);
            });

            $("#tax_input").on("change paste keyup", function() {
                $("#tax").val($("#tax_input").val());
                $("#tax_show").html($("#tax_input").val());
            });


