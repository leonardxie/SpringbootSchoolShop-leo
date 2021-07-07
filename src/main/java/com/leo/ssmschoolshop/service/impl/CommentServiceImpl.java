package com.leo.ssmschoolshop.service.impl;


import com.leo.ssmschoolshop.dao.CommentMapper;
import com.leo.ssmschoolshop.entity.Comment;
import com.leo.ssmschoolshop.entity.CommentExample;
import com.leo.ssmschoolshop.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired(required = false)
    private CommentMapper commentMapper;

    @Override
    public void insertSelective(Comment comment){
        commentMapper.insertSelective(comment);
    }

    @Override
    public List<Comment> selectByExample(CommentExample commentExample) {
        return commentMapper.selectByExample(commentExample);
    }

}
