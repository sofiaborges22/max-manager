$(function(){
	$('.decision-tree-btn').on('click', function(){
			$('#problems').empty();
			$.ajax({
				type: 'get',
				url: '/problems',
				success: function(response){
					var problems_decisions = response.filter(function(problem){
						return problem.category == 'Decision Tree Tool'
					})
					var decisions = problems_decisions.forEach(function(decision){
						var decisionTitle = decision.title;
						var decisionDescription = decision.description;
						$('#problems').show()
						$('#problems').append($('<h3>').text(decisionTitle));
						$('#problems').append($('<h5>').text(decisionDescription));
						$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" href="/users/'+decision.user_id+'/problems/'+decision.id+'/form_decision">Analyze</a>'));
						$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/users/'+decision.user_id+'/problems/'+decision.id+'">Delete</a>'));
					})
				},
				error: function(error){
					console.log(error);
				}
			})
		});

});
