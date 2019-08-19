package br.com.adotepets.infrastructure.i18n;

import lombok.Setter;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

import java.util.Locale;

public class MessageHolder {

    @Setter
    private static MessageSource source;

    /**
     * @param code
     * @return
     */
    public static String getMessage(String code) {
        return MessageHolder.getMessage(code, code);
    }

    /**
     * @param code
     * @param parameters
     * @return
     */
    public static String getMessage(String code, Object... parameters) {
        return MessageHolder.getMessage(code, code, parameters);
    }

    /**
     * @param code
     * @param parameters
     * @param defaultMessage
     * @return
     */
    public static String getMessage(String code, String defaultMessage, Object... parameters) {
        return MessageHolder.source.getMessage(code, parameters, LocaleContextHolder.getLocale());
    }

    /**
     * @param code
     * @param parameters
     * @param defaultMessage
     * @param locale
     * @return
     */
    public static String getMessage(String code, String defaultMessage, Locale locale, Object... parameters) {
        return MessageHolder.source.getMessage(code, parameters, code, locale);
    }
}
