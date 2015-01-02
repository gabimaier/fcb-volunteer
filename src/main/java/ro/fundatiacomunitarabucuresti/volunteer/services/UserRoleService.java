package ro.fundatiacomunitarabucuresti.volunteer.services;
import org.springframework.roo.addon.layers.service.RooService;
import ro.fundatiacomunitarabucuresti.volunteer.domain.UserRole;

@RooService(domainTypes = { ro.fundatiacomunitarabucuresti.volunteer.domain.UserRole.class })
public interface UserRoleService {
    void saveUserRole(UserRole userRole);
}
