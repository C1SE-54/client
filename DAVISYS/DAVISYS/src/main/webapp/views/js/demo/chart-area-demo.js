// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

const dtbAllMonth = [];
const labels = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6",
	"Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];

$.ajax({
	url: "/getTotalMonth/",
	type: "get",
	data: {
		repCommentIdUser: 'asd'
	},
	success: function(data) {
		dtbAllMonth.push(...data);
	// success: function(data) {
	// 	// Giả sử data trả về là mảng [{ month: 1, count: 10 }, { month: 2, count: 5 }, ...]
	// 	const dtbAllMonth = [];
	// 	data.forEach(item => {
	// 		dtbAllMonth.push(item.count); // Chỉ lấy count từ dữ liệu trả về
	// 	});
		// Lấy tháng hiện tại (0 = Tháng 1, 11 = Tháng 12)
		const currentMonth = new Date().getMonth();

		// Sắp xếp lại labels và data theo tháng hiện tại
		const sortedLabels = [...labels.slice(currentMonth), ...labels.slice(0, currentMonth)];
		const sortedData = [...dtbAllMonth.slice(currentMonth), ...dtbAllMonth.slice(0, currentMonth)];

		// Cập nhật biểu đồ
		updateChart(sortedLabels, sortedData);
	},
	error: function(xhr) {
		alert("Error fetching data");
	}
});

function updateChart(sortedLabels, sortedData) {
	var ctx = document.getElementById("myAreaChart");
	var myLineChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: sortedLabels, // Tháng đã sắp xếp
			datasets: [{
				label: "Số bài",
				lineTension: 0.3,
				backgroundColor: "rgba(78, 115, 223, 0.05)",
				borderColor: "rgba(78, 115, 223, 1)",
				pointRadius: 3,
				pointBackgroundColor: "rgba(78, 115, 223, 1)",
				pointBorderColor: "rgba(78, 115, 223, 1)",
				pointHoverRadius: 3,
				pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
				pointHoverBorderColor: "rgba(78, 115, 223, 1)",
				pointHitRadius: 10,
				pointBorderWidth: 2,
				data: sortedData, // Dữ liệu đã sắp xếp
			}],
		},
		options: {
			maintainAspectRatio: false,
			layout: {
				padding: {
					left: 10,
					right: 25,
					top: 25,
					bottom: 0
				}
			},
			scales: {
				xAxes: [{
					time: {
						unit: 'date'
					},
					gridLines: {
						display: false,
						drawBorder: false
					},
					ticks: {
						maxTicksLimit: 7
					}
				}],
				yAxes: [{
					ticks: {
						maxTicksLimit: 5,
						padding: 10,
						callback: function(value, index, values) {
							return 'Số bài: ' + number_format(value);
						}
					},
					gridLines: {
						color: "rgb(234, 236, 244)",
						zeroLineColor: "rgb(234, 236, 244)",
						drawBorder: false,
						borderDash: [2],
						zeroLineBorderDash: [2]
					}
				}],
			},
			legend: {
				display: false
			},
			tooltips: {
				backgroundColor: "rgb(255,255,255)",
				bodyFontColor: "#858796",
				titleMarginBottom: 10,
				titleFontColor: '#6e707e',
				titleFontSize: 14,
				borderColor: '#dddfeb',
				borderWidth: 1,
				xPadding: 15,
				yPadding: 15,
				displayColors: false,
				intersect: false,
				mode: 'index',
				caretPadding: 10,
				callbacks: {
					label: function(tooltipItem, chart) {
						var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
						return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
					}
				}
			}
		}
	});
}

function number_format(number, decimals, dec_point, thousands_sep) {
	number = (number + '').replace(',', '').replace(' ', '');
	var n = !isFinite(+number) ? 0 : +number,
		prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		s = '',
		toFixedFix = function(n, prec) {
			var k = Math.pow(10, prec);
			return '' + Math.round(n * k) / k;
		};
	s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	if (s[0].length > 3) {
		s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	}
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
	}
	return s.join(dec);
}
function deletePost(postId) {
	if (confirm("Bạn có chắc chắn muốn xóa bài đăng này không?")) {
		fetch(`/admin/report/delete/${postId}`, {
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json'
			}
		})
			.then(response => {
				if (response.ok) {
					alert("Bài đăng đã được xóa thành công.");
					window.location.reload(); // Tải lại trang sau khi xóa
				} else {
					alert("Không thể xóa bài đăng. Vui lòng thử lại sau.");
				}
			})
			.catch(error => {
				console.error("Error:", error);
				alert("Đã xảy ra lỗi.");
			});
	}
}

