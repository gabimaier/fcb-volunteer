package ro.fundatiacomunitarabucuresti.volunteer.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Tag;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.services.CityService;
import ro.fundatiacomunitarabucuresti.volunteer.services.SkillService;
import ro.fundatiacomunitarabucuresti.volunteer.services.VolunteerService;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/volunteers/**")
@Controller
public class VolunteerController {

    @Autowired
    private CityService cityService;
    @Autowired
    private SkillService skillService;
    @Autowired
    private VolunteerService volunteerService;

//    @RequestMapping(method = RequestMethod.POST, value = "{id}")
//    public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
//    }

//    @RequestMapping
//    public String index() {
//        return "volunteers/index";
//    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Volunteer volunteer, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, volunteer);
            return "volunteers/create";
        }
        uiModel.asMap().clear();
        volunteerService.saveVolunteer(volunteer);
        return "redirect:/";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Volunteer());
        return "volunteers/create";
    }

    private void populateEditForm(Model uiModel, Volunteer volunteer) {
        uiModel.addAttribute("volunteer", volunteer);
        uiModel.addAttribute("citys", cityService.findAllCitys());
        uiModel.addAttribute("skills", skillService.findAllSkills());
    }
}
