<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<script type="text/javascript">
		$(document).ready(function(){
             var m = moment();
            var output = m.format("YYYY-MM-DD");
			$('#date').bootstrapMaterialDatePicker
			({
				time: false
			});



			$('#date-end').bootstrapMaterialDatePicker
			({
              

                time:false,
				 format: 'YYYY-MM-DD'
			});
            
			$('#date-start').bootstrapMaterialDatePicker
			({
                time:false,
				format: 'YYYY-MM-DD'
			}).on('change', function(e, date)
			{
				$('#date-end').bootstrapMaterialDatePicker('setMinDate', date);
			});
            $('#date-start').bootstrapMaterialDatePicker('setMinDate', m.format("YYYY-MM-DD"));
            $('#date-end').bootstrapMaterialDatePicker('setMinDate', m.format("YYYY-MM-DD"));
			$.material.init()
		});
		</script>
	<script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/js/wow.min.js'/>"></script>
	<script src="<c:url value='/js/typewriter.js'/>"></script>
	<script src="<c:url value='/js/jquery.onepagenav.js'/>"></script>
	<script src="<c:url value='/js/main.js'/>"></script>