package kr.co.mlec.Board;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import kr.co.mlec.VO.BoardVO;
import kr.co.mlec.VO.CriteriaVO;
import kr.co.mlec.VO.PagingVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("/select.do")
	public ModelAndView boardSelect(CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		List<BoardVO> list = service.boardSelectPaging(cri);
		mav.addObject("list", list);
		int total = service.getBoardTotalNum(cri);
		PagingVO paging = new PagingVO(cri, total);
		mav.addObject("paging", paging);

		return mav;
	}

	@RequestMapping("/boardSelectByUser.json")
	@ResponseBody
	public List<BoardVO> boardSelectByUser(@RequestParam(value = "username") String username) throws Exception {
		List<BoardVO> list = service.boardSelectByUser(username);

		return list;
	}

	@RequestMapping("/detail.json")
	@ResponseBody
	public BoardVO boardDetail(@RequestParam(value = "boardNo") int boardNo, CriteriaVO cri) throws Exception {
		BoardVO board = service.boardDetail(boardNo);
		return board;
	}
	
	@RequestMapping("/detailAdmin.do")
	@ResponseBody
	public ModelAndView boardDetailAdmin(@RequestParam(value = "boardNo") int boardNo, CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("board/detail");
		BoardVO board = service.boardDetail(boardNo);
		mav.addObject("board", board);
		mav.addObject("cri", cri);
		
		return mav;
	}

	@RequestMapping("/insert.do")
	public ModelAndView boardInsert(BoardVO board) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		service.boardInsert(board);
		mav.setViewName("redirect:select.do");

		return mav;
	}

	@RequestMapping("/delete.do")
	public ModelAndView boardDelete(@RequestParam(value = "boardNo") int boardNo, CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		service.boardDelete(boardNo);
		String keyword = (cri.getKeyword() == null) ? "" : cri.getKeyword();
		mav.setViewName("redirect:select.do?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount() + "&keyword=" + keyword);

		return mav;
	}

	@RequestMapping("/updateForm.do")
	public ModelAndView updateForm(CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("board/updateForm");
		BoardVO board = service.boardDetail(cri.getBoardNo());
		mav.addObject("board", board);
		mav.addObject("cri", cri);

		return mav;
	}

	@RequestMapping("/update.do")
	public ModelAndView boardUpdate(BoardVO board, CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		service.boardUpdate(board);
		mav.setViewName("redirect:select.do?boardNo=" + cri.getBoardNo() + "&pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount() + "&keyword=" + cri.getKeyword());

		return mav;
	}

	@RequestMapping("/imageUpload.do")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartHttpServletRequest multiFile,
			MultipartFile upload) throws Exception {
		
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;

		// encoding
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html'charset=utf-8");

		try {
			// get filename
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// make image path
			// need to change path (server)
			String path = "/images/board";
			String ckUploadPath = path + "/" + uid + "_" + fileName;
			File folder = new File(path);

			if (!folder.exists()) {
				try {
					folder.mkdirs();
				} catch (Exception e) {
					// TODO: handle exception
					e.getStackTrace();
				}
			}
			// save image
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();

			
			//String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = req.getContextPath() + "/board/imageSubmit.do?uid=" + uid + "&fileName=" + fileName;
			
			JsonObject json = new JsonObject();
			json.addProperty("filename", fileName);
			json.addProperty("uploaded", 1);
			json.addProperty("url", fileUrl);

			printWriter.println(json);
			printWriter.flush();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return;
	}

	@RequestMapping("/imageSubmit.do")
	public void imageSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path = "/images/board"; 
		String sDirPath = path + "/" + uid + "_" + fileName;
		
		File imgFile = new File(sDirPath);
		
		if(imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;
			
			FileInputStream fileInputStream  = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out  = null;
			
			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = res.getOutputStream();
				
				while((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}
				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}
}
