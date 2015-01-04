package ro.fundatiacomunitarabucuresti.volunteer.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.viewServices.UserAccountViewService;

@RequestMapping("/volunteers/**")
@Controller
public class VolunteerController {

    @Autowired
    private UserAccountViewService userAccountViewService;

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Volunteer volunteer, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            userAccountViewService.populateEditForm(uiModel, volunteer);
            return "volunteers/create";
        }
        uiModel.asMap().clear();
        userAccountViewService.createVolunteer(volunteer);
        return "redirect:/";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        userAccountViewService.populateEditForm(uiModel, new Volunteer());
        return "volunteers/create";
    }
}
