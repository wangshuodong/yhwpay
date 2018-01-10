package com.wangsd.common.scan;

import com.wangsd.common.entity.JSONResult;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

/**
 * 捕获异常统一处理
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger LOGGER = LogManager.getLogger(GlobalExceptionHandler.class);

    private final static String EXPTION_MSG_KEY = "message";

    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public JSONResult handleBizExp(HttpServletRequest request, Exception ex) {
        LOGGER.info("自定义业务异常：" + ex.getMessage());
//        request.getSession(true).setAttribute(EXPTION_MSG_KEY, ex.getMessage());
        JSONResult jsonResult = new JSONResult();
        jsonResult.setMessage(ex.getMessage());
        jsonResult.setSuccess(false);
        return jsonResult;
    }

    @ExceptionHandler(SQLException.class)
    public ModelAndView handSql(Exception ex) {
        LOGGER.info("SQL 异常：" + ex.getMessage(), ex);
        ModelAndView mv = new ModelAndView();
        mv.addObject("message", ex.getMessage());
        mv.setViewName("sql_error");
        return mv;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public JSONResult processValidationError(MethodArgumentNotValidException ex) {
        LOGGER.error(ex.getMessage(), ex);
        BindingResult result = ex.getBindingResult();
        FieldError error = result.getFieldError();
        return getFieldErrorResult(error);
    }

    @ExceptionHandler(BindException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public JSONResult processException(BindException ex) {
        LOGGER.error(ex.getMessage(), ex);
        FieldError error = ex.getFieldError();
        return getFieldErrorResult(error);
    }

    /**
     * 对hibernate-validator异常错误信息简单处理
     *
     * @param error
     * @return
     */
    private JSONResult getFieldErrorResult(FieldError error) {
        StringBuilder errorMsg = new StringBuilder(100);
        errorMsg.append("$(form).find(\"[name=\\\"");
        errorMsg.append(error.getField());
        errorMsg.append("\\\"]\").closest(\"td\").prev().text() + \"，");
        errorMsg.append(error.getDefaultMessage());
        errorMsg.append("\"");
        JSONResult _result = new JSONResult();
        _result.setMessage(errorMsg.toString());
        return _result;
    }

}
