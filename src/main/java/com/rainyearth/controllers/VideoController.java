package com.rainyearth.controllers;

import com.rainyearth.video.Video;
import com.rainyearth.video.VideoCreateRequestVO;
import com.rainyearth.video.VideoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Null;
import java.util.ArrayList;

/**
 * Created by SW on 2015. 8. 29..
 */
@Controller
public class VideoController {

    static final Logger log = LoggerFactory.getLogger(Video.class);

    @Autowired
    private VideoService videoService;

    @RequestMapping(value = "/video", method = RequestMethod.POST)
    public String uploadVideo(@ModelAttribute VideoCreateRequestVO videoCreateRequestVO, HttpServletRequest request, Model model) throws Exception{


        // tags 배열에 올바르게 값 들어가게 하기 위해
        int k = 0;
        ArrayList<String> arrayList = new ArrayList<String>();
        for(int i = 0 ; i<videoCreateRequestVO.getVideoTags().length ; i+=2){
            String tmpStr = videoCreateRequestVO.getVideoTags()[i].replaceAll(";", "");
            arrayList.add(tmpStr);
        }
        videoCreateRequestVO.setVideoTags(arrayList.toArray(new String[arrayList.size()]));
        for(int i = 0 ; i<videoCreateRequestVO.getVideoTags().length ; i++){
            log.error("AAAA  " + i + "   "  + videoCreateRequestVO.getVideoTags()[i]);
        }

        try{
            videoService.create(videoCreateRequestVO);
            return "redirect:/";
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            if(e.getMessage().contains("String index out of range"))
                return String.format("redirect:/error?message=%s", "Wrong URL format!");
            return String.format("redirect:/error?message=%s", e.getMessage());
        }



    }
}
