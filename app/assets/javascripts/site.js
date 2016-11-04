$(function(){
	$('#decision_favorable_probability').on('input',function(){
		$('#decision_unfavorable_probability').val(100 - $(this).val())
	})

	$('#decision_unfavorable_probability').on('input',function(){
		$('#decision_favorable_probability').val(100 - $(this).val())
	})

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
					var problem = decision.id
					$('#problems').show()
					$('#problems').append($('<h3>').text(decisionTitle));
					$('#problems').append($('<h5>').text(decisionDescription));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" href="/problems/' + problem + '/decisions">Analyze</a>'));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/problems/'+ problem +'">Delete</a>'));
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
					var problem = break_even.id
					$('#problems').show()
					$('#problems').append($('<h3>').text(breakEvenTitle));
					$('#problems').append($('<h5>').text(breakEvenDescription));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" href="/problems/'+ problem +'/break_evens/new">Analyze</a>'));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/problems/'+ problem +'">Delete</a>'));
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
					var crossoverTitle = crossover.title;
					var crossoverDescription = crossover.description;
					var problem = crossover.id
					$('#problems').show()
					$('#problems').append($('<h3>').text(crossoverTitle));
					$('#problems').append($('<h5>').text(crossoverDescription));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" href="/problems/'+ problem +'/crossover_analysis">Analyze</a>'));
					$('#problems').append($('<a class="problem-btn btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/problems/'+ problem +'">Delete</a>'));					
				})
			},
			error: function(error){
				console.log(error);
			}			
		})
	});


});
