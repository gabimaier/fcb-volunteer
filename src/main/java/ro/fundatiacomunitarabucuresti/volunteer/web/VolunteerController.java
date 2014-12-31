package ro.fundatiacomunitarabucuresti.volunteer.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Tag;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;

@RequestMapping("/volunteers/**")
@Controller
public class VolunteerController {

    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

//    @RequestMapping
//    public String index() {
//        return "volunteers/index";
//    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Volunteer());
        return "volunteers/create";
    }

    private void populateEditForm(Model uiModel, Volunteer tag) {
        uiModel.addAttribute("volunteer", tag);
    }
}
