package br.com.adotepets.infrastructure.misc;


public final class CodeGenerator {

    private static final String NUMERIC = "1234567890";
    private static final String ALPHANUMERIC = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     * Generates a random code of numbers to identify something
     *
     * @param length the length of this random code
     * @return the generated random code
     */
    public static String numeric(int length) {
        return CodeGenerator.generate(length, CodeGenerator.NUMERIC);
    }

    /**
     * Generates a random code of numbers and chars to identify something
     *
     * @param length the length of this random code
     * @return the generated random code
     */
    public static String alphanumeric(int length) {
        return CodeGenerator.generate(length, CodeGenerator.ALPHANUMERIC);
    }

    /**
     * The real method that generate the codes based on the current time in nanos
     *
     * @param length       the size of the code
     * @param baseSequence the sequence to be used to create de codes
     * @return the generated code
     */
    private static String generate(int length, String baseSequence) {

        long decimalNumber = System.nanoTime();

        int mod;
        int codeLength = 0;

        final StringBuilder builder = new StringBuilder();

        while (decimalNumber != 0 && codeLength < length) {
            mod = (int) (decimalNumber % baseSequence.length());
            builder.append(baseSequence.substring(mod, mod + 1));
            decimalNumber = decimalNumber / baseSequence.length();
            codeLength++;
        }

        return builder.toString();
    }
}