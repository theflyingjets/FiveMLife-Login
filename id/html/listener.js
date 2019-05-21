$(function(){
	window.onload = (e) => {
        /* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
            //document.querySelector("#logo").innerHTML = " "
			var item = event.data;
			var fnTData = event.data.fName;
			var lnTData = event.data.lName;
			var BTData = event.data.birth;
			var STData = event.data.sE;
			var IDTData = event.data.Num;

			if (item !== undefined && item.type === "ui") {
				$('.fnData').html(fnTData);
				$('.lnData').html(lnTData);
				$('.Bdata').html(BTData);
				$('.SData').html(STData);
				$('.IDData').html(IDTData);
                /* if the display is true, it will show */
				if (item.display === true) {
					$("#container").show();
                     /* if the display is false, it will hide */
				} else{
                    $("#container").hide();
				}
			}
		});
	};
});