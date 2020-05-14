$(document).ready(function() {
	$("#formcalc").validate({
		rules: {
			massN: {
				required: true,
				min: 0,
				max: 1e+6
			},
			altN: {
				required: true,
				min: 0,
				max: 2.0e+9
			},
			nameNX: {
				required: true,
				maxlength: 30
			},
			gXN: {
				required: true,
				min: 0.0000000000001,
				max: 500
			},
			rXN: {
				required: true,
				min: 100000,
				max: 10000000000
			},
			MXN: {
				required: true,
				min: 1e+10,
				max: 1e+40
			},
			TXN: {
				required: true,
				min: -250,
				max: 6000
			}
		}, //rules end
		messages: {
			massN: {
				required: "Please enter the mass of a satellite",
				min: $.validator.format("Has to be larger than 0"),
				max: $.validator.format("Cannot exceed 1e+6kg")
			},
			altN: {
				required: "Please enter the altitutde of a satellite",
				min: $.validator.format("Has to be larger than 0"),
				max: $.validator.format("Cannot exceed 2.0e+9m")
			},
			nameNX: {
				required: "Name of the planet is required",
				maxlength: $.validator.format("Has to be shorter than 30 character")
			},
			gXN: {
				required: "Gravity of the planet is required",
				min: $.validator.format("Has to be larger than 0"),
				max: $.validator.format("Cannot exceed {0} m/s" + "2".sup())
			},
			rXN: {
				required: "Radius of the planet is required",
				min: $.validator.format("Has to be larger than {0} m"),
				max: $.validator.format("Cannot exceed {0} m")
			},
			MXN: {
				required: "Mass of the planet is required",
				min: $.validator.format("Has to be larger than {0} kg"),
				max: $.validator.format("Cannot exceed {0} kg")
			},
			TXN: {
				required: "Average temperature of the planet is required",
				min: $.validator.format("Has to be larger than {0} &#x2103"), //Celsius Unicode
				max: $.validator.format("Cannot exceed {0} &#x2103") 
			}
		} //messages end
	}); //idform ends






	$("#formpers").validate({
		ignore: [],
		rules: {
			firstN: {
				required: true,
				maxlength: 30
			},
			middleN: {
				required: false,
				maxlength: 30
			},
			lastN: {
				required: true,
				maxlength: 30
			},
			phoneN: {
				required: true,
				digits: true,
				maxlength: 15
			},
			emailN: {
				required: true,
				maxlength: 30,
				email: true
			},
			usernameN: {
				required: true,
				minlength: 6,
				maxlength: 30
			},
			passwordN: {
				required: true,
				minlength: 6,
				maxlength: 30
			},
			dateN: {
				date: true
			}
		}, //rules end
		messages: {
			firstN: {
				required: "Please enter your first name",
				maxlength: $.validator.format("Cannot exceed {0} characters")
			},
			middleN: {
				maxlength: $.validator.format("Cannot exceed {0} characters")
			},
			lastN: {
				required: "Please enter your last name",
				maxlength: $.validator.format("Cannot exceed {0} characters")
			},
			phoneN: {
				required: "Please enter your preferred phone number",
				digits: "This field accepts numbers only",
				maxlength: "Cannot exceed {0} characters"
			},
			emailN: {
				required: "Please enter your preferred email address",
				maxlength: $.validator.format("Cannot exceed {0} characters"),
				email: "Email address is not valid"
			},
			usernameN: {
				required: "Please enter your username",
				minlength: $.validator.format("Minimum number of characters is {0}."),
				maxlength: $.validator.format("Cannot exceed {0} characters")
			},
			passwordN: {
				required: "Please enter your password",
				minlength: $.validator.format("Minimum number of characters is {0}."),
				maxlength: $.validator.format("Cannot exceed {0} characters")
			},
			dateN: {
				date: "Please enter a valid date"
			}
		} //messages end
	}); //formpers ends
}); //doc.ready ends