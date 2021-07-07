package com.leo.ssmschoolshop.service;


import com.leo.ssmschoolshop.entity.Comment;
import com.leo.ssmschoolshop.entity.CommentExample;

import java.util.List;

public interface CommentService {
    public void insertSelective(Comment comment);

    public List<Comment> selectByExample(CommentExample commentExample);
}
