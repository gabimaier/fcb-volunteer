package ro.fundatiacomunitarabucuresti.volunteer.web;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;

@RequestMapping("/volunteerapplications")
@Controller
@RooWebScaffold(path = "volunteerapplications", formBackingObject = VolunteerApplication.class)
public class VolunteerApplicationController {
}
