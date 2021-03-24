# ======================
# 		Breadth Req
#=======================
breadth_req_sys = [
	{
		:course_identifier => "COMSW4111",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4113",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4115",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4118",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "CSEEW4119",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4156",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "CSEEW4119",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "CSEEW4824",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "CSEEW4868",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4181",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4182",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4186",
		:is_systems_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4444",
		:is_systems_breadth_requirement => true
	}
]

breadth_req_theory = [
	{
		:course_identifier => "CSORW4231",
		:is_theory_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4236",
		:is_theory_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4252",
		:is_theory_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4261",
		:is_theory_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4281",
		:is_theory_breadth_requirement => true
	},
]

breadth_req_aiapp = [
	{
		:course_identifier => "COMSW4701",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4705",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4731",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4732",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4733",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "CBMFW4761",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4771",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4774",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4775",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4160",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4167",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4170",
		:is_aiapplications_breadth_requirement => true
	},
	{
		:course_identifier => "COMSW4172",
		:is_aiapplications_breadth_requirement => true
	}
]

(breadth_req_sys + breadth_req_theory + breadth_req_aiapp).each do |req|
	course = Course.find_by(:course_identifier => req[:course_identifier])
	req.delete(:course_identifier)
	if course
		puts req[:course_identifier]
		(1..7).each do |n|
			req[:track_id] = n
			course.trackRequirements.find_or_create_by(req)
		end
	end
end

# ======================
# 		Required
#=======================

compBio = [
	{
		:track_id => 1,
		:course_identifier => "COMSW4761",
		:is_required => true
	},
	{
		:track_id => 1,
		:course_identifier => "COMSW4771",
		:is_required => true
	}
]

compSecurity = [
	{
		:track_id => 2,
		:course_identifier => "COMSW4118",
		:is_required => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4156",
		:is_required => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4181",
		:is_required => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4182",
		:is_required => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4261",
		:is_required => true
	}
]

foundOfComp = [
	{
		:track_id => 3,
		:course_identifier => "CSORW4231",
		:is_required => true
	},
	{
		:track_id => 3,
		:course_identifier => "COMSW4236",
		:is_required => true
	}
]

ml = [
	{
		:track_id => 4,
		:course_identifier => "COMSW4252",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4771",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4772 ",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW6701",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4773",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4774",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4775",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4731",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4705",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4733",
		:is_required => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMSW4701",
		:is_required => true
	}
]

nlp = [
	{
		:track_id => 5,
		:course_identifier => "COMSW4705",
		:is_required => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMSW4706",
		:is_required => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMSE6998",
		:is_required => true
	}
]

networkSys = [
	{
		:track_id => 6,
		:course_identifier => "CSEEW4119",
		:is_required => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSW4118",
		:is_required => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSW4115",
		:is_required => true
	}
]

softwareSys = [
	{
		:track_id => 7,
		:course_identifier => "COMSW4115",
		:is_required => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4118",
		:is_required => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4156",
		:is_required => true
	}
]

cv = [
	{
		:track_id => 8,
		:course_identifier => "COMSW4160",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4167",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4170",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4172",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4731",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4733",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4735",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4771",
		:is_required => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMSW4737",
		:is_required => true
	},
]

(compBio + compSecurity + foundOfComp + ml + nlp + networkSys + softwareSys + cv).each do |req|
	course = Course.find_by(:course_identifier => req[:course_identifier])
	req.delete(:course_identifier)
	if course
		puts req[:course_identifier]
		course.trackRequirements.find_or_create_by(req)
	end
end


# ======================
# 		General Elective
#=======================

compBio = [
	{
		:track_id => 1,
		:course_identifier => "COMSW4111",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "COMSW4252",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "COMSW4772",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "COMSW4995",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "COMSE6111",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "COMSE6901",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "COMSE6998",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "EECSE6720",
		:is_elective => true
	},
	{
		:track_id => 1,
		:course_identifier => "EECSE6894",
		:is_elective => true
	}
]

compSecurity = [
	{
		:track_id => 2,
		:course_identifier => "COMSW4115",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4119",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4186",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4261",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSW4995",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6118",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6181",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6183",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6184",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6185",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6261",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6424",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "CSEEE6863",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "COMSE6901",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "CSEEW4824",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "ELENE4703",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "ELENE6761",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "ELENE6886",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "ELENE6950",
		:is_elective => true
	},
	{
		:track_id => 2,
		:course_identifier => "ELENE6951",
		:is_elective => true
	}
]

# incomplete
foundOfComp = [
	{
		:track_id => 3,
		:course_identifier => "CSORW4231",
		:is_elective => true
	},
	{
		:track_id => 3,
		:course_identifier => "COMSW4236",
		:is_elective => true
	}
]

# incomplete
ml = [
	{
		:track_id => 4,
		:course_identifier => "COMS W4111",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4252",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "CSOR W4246",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4705",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4731",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4733",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4737",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4761",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4771",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4772",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4776",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS W4995",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS E6111",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS E6232",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS E6253",
		:is_elective => true
	},
	{
		:track_id => 4,
		:course_identifier => "COMS E6735",
		:is_elective => true
	}
]

# incomplete
nlp = [
	{
		:track_id => 5,
		:course_identifier => "COMS W4170",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS W4172",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS W4252",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS W4701",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS W4771",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS W4772",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS 4995",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS E6901",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "COMS E6998",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "SIEO W4150",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "ECBM E6040",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "EECS E6894",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "ELEN E4810",
		:is_elective => true
	},
	{
		:track_id => 5,
		:course_identifier => "ELEN E6829",
		:is_elective => true
	}
]

networkSys = [
	{
		:track_id => 6,
		:course_identifier => "CSEEW4140",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSW4180",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSW4261",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSW4737",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSW4995",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6118",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6125",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6180",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6181",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6184",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6185",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6717",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6737",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6901",
		:is_elective => true
	},
	{
		:track_id => 6,
		:course_identifier => "COMSE6998",
		:is_elective => true
	}
]

softwareSys = [
	{
		:track_id => 7,
		:course_identifier => "COMSW4111",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4112",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4113",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4117",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4130",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4170",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4181",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSW4444",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "CSEEW4840",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6111",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6113",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6114",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6117",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6118",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6121",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6156",
		:is_elective => true
	},
	{
		:track_id => 7,
		:course_identifier => "COMSE6424",
		:is_elective => true
	}
]

cv = [
	{
		:track_id => 8,
		:course_identifier => "COMS W4160",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4162",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4165",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4167",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4170",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4172",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4731",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4733",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4735",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4737",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4771",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4772",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS W4995",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6160",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6161",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6174",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6176",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6731",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6732",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6733",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6734",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6735",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6737",
		:is_elective => true
	},
	{
		:track_id => 8,
		:course_identifier => "COMS E6901",
		:is_elective => true
	},
]

(compBio + compSecurity + foundOfComp + ml + nlp + networkSys + softwareSys + cv).each do |req|
	course = Course.find_by(:course_identifier => req[:course_identifier])
	req.delete(:course_identifier)
	if course
		puts req[:course_identifier]
		course.trackRequirements.find_or_create_by(req)
	end
end