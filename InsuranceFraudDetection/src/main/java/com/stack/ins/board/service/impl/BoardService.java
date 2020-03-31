
package com.stack.ins.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stack.ins.board.dao.IBoardRepository;
import com.stack.ins.board.model.Board;
import com.stack.ins.board.model.BoardFile;
import com.stack.ins.board.service.IBoardService;


@Service
public class BoardService implements IBoardService {

	@Autowired
	@Qualifier("IBoardRepository")
	IBoardRepository boardRepository;

	@Transactional
	public void insertArticle(Board board) {
		board.setBoardId(boardRepository.selectMaxArticleNo()+1);
		boardRepository.insertArticle(board);
	}
	
	@Transactional
	public void insertArticle(Board board, BoardFile file) {
		board.setBoardId(boardRepository.selectMaxArticleNo()+1);
		boardRepository.insertArticle(board);
        if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
        	file.setBoardId(board.getBoardId());
        	boardRepository.insertFileData(file);
        }
	}

	@Override
	public List<Board> selectArticleList(int page) {
		int start = (page-1) * 10 + 1;
		return boardRepository.selectArticleList(start, start+10);
	}

	@Override
	public List<Board> selectArticleListByCategory(int categoryId, int page) {
		int start = (page-1) * 10;
		return boardRepository.selectArticleListByCategory(categoryId, start, start+10);
	}

	@Override
	public List<Board> selectArticleListByCategory(int categoryId) {
		return boardRepository.selectArticleListByCategory(categoryId, 0, 100);
	}

	@Transactional
	public Board selectArticle(int boardId) {
		boardRepository.updateReadCount(boardId);
		return boardRepository.selectArticle(boardId);
	}

	@Override
	public BoardFile getFile(int fileId) {
		return boardRepository.getFile(fileId);
	}
	
	@Transactional
	public void replyArticle(Board board) {
		boardRepository.updateReplyNumber(board.getMasterId(), board.getReplyNumber());
		board.setBoardId(boardRepository.selectMaxArticleNo()+1);
		board.setReplyNumber(board.getReplyNumber()+1);
		board.setReplyStep(board.getReplyStep()+1);
		boardRepository.replyArticle(board);
	}

	@Transactional
	public void replyArticle(Board board, BoardFile file) {
		boardRepository.updateReplyNumber(board.getMasterId(), board.getReplyNumber());
		board.setBoardId(boardRepository.selectMaxArticleNo()+1);
		board.setReplyNumber(board.getReplyNumber()+1);
		board.setReplyStep(board.getReplyStep()+1);
		boardRepository.replyArticle(board);
        if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
        	file.setBoardId(board.getBoardId());
        	boardRepository.insertFileData(file);
        }
	}
	
	@Override
	public String getPassword(int boardId) {
		return boardRepository.getPassword(boardId);
	}

	@Override
	public void updateArticle(Board board) {
		boardRepository.updateArticle(board);
	}

	@Transactional
	public void updateArticle(Board board, BoardFile file) {
		boardRepository.updateArticle(board);
        if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
        	file.setBoardId(board.getBoardId());
//        	System.out.println(file.toString());
        	if(file.getFileId()>0) {
        		boardRepository.updateFileData(file);
        	}else {
        		boardRepository.insertFileData(file);
        	}
        }
	}
	
	@Override
	public Board selectDeleteArticle(int boardId) {
		return boardRepository.selectDeleteArticle(boardId);
	}
	
	@Transactional
	public void deleteArticle(int boardId, int replyNumber) {
		boardRepository.deleteFileData(boardId);
		if(replyNumber>0) {
			boardRepository.deleteArticleByBoardId(boardId);
		}else if(replyNumber==0){
			boardRepository.deleteArticleByMasterId(boardId);
		}else {
			throw new RuntimeException("WRONG_REPLYNUMBER");
		}
	}

	@Override
	public int selectTotalArticleCount() {
		return boardRepository.selectTotalArticleCount();
	}

	@Override
	public int selectTotalArticleCountByCategoryId(int categoryId) {
		return boardRepository.selectTotalArticleCountByCategoryId(categoryId);
	}

	@Override
	public List<Board> searchListByContentKeyword(String keyword) {
		return boardRepository.searchListByContentKeyword(keyword);
	}

}
