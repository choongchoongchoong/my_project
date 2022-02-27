package pack.controller.selling;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pack.model.member.MemberDaoInter;
import pack.model.selling.SellingDaoInter;
import pack.model.selling.SellingDto;

@Controller
public class SellingFileUploadController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	
	//파일 등록 매핑
	@RequestMapping(value = "sell", method = RequestMethod.POST)
	public String fileForm(SellingBean bean, Model model, MultipartFile file) throws Exception {
		
		//저장 경로 지정
		String projectPath = "C:\\Users\\dynabook\\git\\my_project\\src\\main\\webapp\\resources\\statics\\images";
		//랜덤 파일명 생성
		UUID uuid = UUID.randomUUID();
		//파일 이름 = 랜덤 파일명 + 첨부파일명
		String fileName = uuid + "_" + file.getOriginalFilename();

		File saveFile = new File(projectPath, fileName);
				
		file.transferTo(saveFile);
		
		bean.setFilename(fileName);
		bean.setFilepath("/images/" + fileName);
		System.out.println(bean.getFilename());
		System.out.println(bean.getFilepath());
		
		boolean result = sellingDaoInter.insertData(bean);
		
		if(result) {
			model.addAttribute("msg", "사진 등록 완료");
			model.addAttribute("url","/selling/list");
			
			return "redirect";
		}else {
			
			return "redirect:/error";
		}
		
		
	}
	
	/*
	
	// 파일 저장할 위치
    @Value("${file.path}")
    private String file_Path = "file.path=C:\\Users\\dynabook\\Pictures\\Saved Pictures";
    
    private Logger logger = LoggerFactory.getLogger(SellingFileUploadController.class);
    
    // 파일 폼 매핑
    @RequestMapping(value = "sell", method = {RequestMethod.GET, RequestMethod.POST})
    public String fileForm(Locale locale, Model model) {
    	logger.info("fileForm file.path={}", file_Path);
        return "member/signupform";
    }

    // 파일 등록 매핑
    @RequestMapping(value = "sell", method = RequestMethod.POST)
    public String fileUpload(@RequestParam MultipartFile file,
            RedirectAttributes redirectAttributes) throws IOException {
    	logger.info("fileUpload={}", file);
        String uuid = UUID.randomUUID().toString();
        // file upload to system
        File converFile = new File(file_Path, uuid + file.getOriginalFilename());
        logger.info("fileUpload converFile={}", converFile);
        file.transferTo(converFile);

        String msg = file.getOriginalFilename() + " is saved in server db";
        redirectAttributes.addFlashAttribute("msg", msg);
        logger.info("fileUpload={}", msg);
        return "redirect:/";
    }
    
    */

}
