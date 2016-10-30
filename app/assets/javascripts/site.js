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
	
	$('.break-even-btn').on('click', function(){
		$('#problems').empty();
		$.ajax({
			type: 'get',
			url: '/problems',
			success: function(response){
				var problems_break_even = response.filter(function(problem){
					return problem.category == 'Break Even Analysis'
				})

				var break_evens = problems_break_even.forEach(function(break_even){
					var breakEvenTitle = break_even.title;
					var breakEvenDescription = break_even.description;
					$('#problems').show()
					$('#problems').append($('<h3>').text(breakEvenTitle));
					$('#problems').append($('<h5>').text(breakEvenDescription));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" href="/users/' + break_even.user_id + '/problems/' + break_even.id + '/break_evens/new">Analyze</a>'));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/users/' + break_even.user_id + '/problems/' + break_even.id + '">Delete</a>'));
				})

			},
			error: function(error){
				console.log(error);
			}
		})
	});

	$('.crossover-btn').on('click', function(){
		$('#problems').empty();
		$.ajax({
			type: 'get',
			url: '/problems',
			success: function(response){
				var problems_crossover = response.filter(function(problem){
					return problem.category == 'Crossover Analysis'
				})

				var crossovers = problems_crossover.forEach(function(crossover){
					crossoverTitle = crossover.title;
					crossoverDescription = crossover.description;
					$('#problems').show()
					$('#problems').append($('<h3>').text(crossoverTitle));
					$('#problems').append($('<h5>').text(crossoverDescription));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" href="/users/'+crossover.user_id+'/problems/'+crossover.id+'/form_crossover">Analyze</a>'));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/users/' + crossover.user_id + '/problems/' + crossover.id + '">Delete</a>'));					
				})
			},
			error: function(error){
				console.log(error);
			}			
		})
	});


});
