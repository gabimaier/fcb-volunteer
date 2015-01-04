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
import ro.fundatiacomunitarabucuresti.volunteer.domain.Organization;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.viewServices.UserAccountViewService;

@RequestMapping("/organizations/**")
@Controller
public class OrganizationController {

    @Autowired
    private UserAccountViewService userAccountViewService;

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Organization organization, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            userAccountViewService.populateEditForm(uiModel, organization);
            return "organizations/create";
        }
        uiModel.asMap().clear();
        userAccountViewService.createOrganization(organization);
        return "redirect:/";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        userAccountViewService.populateEditForm(uiModel, new Organization());
        return "organizations/create";
    }
}
