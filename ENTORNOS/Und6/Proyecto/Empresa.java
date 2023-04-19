

/**
 * Class Empresa
 */
public class Empresa {

  //
  // Fields
  //

  private String CIF;
  private String razonSocial;
  private String direccion;
  private long int tlf;
  
  //
  // Constructors
  //
  public Empresa () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of CIF
   * @param newVar the new value of CIF
   */
  public void setCIF (String newVar) {
    CIF = newVar;
  }

  /**
   * Get the value of CIF
   * @return the value of CIF
   */
  public String getCIF () {
    return CIF;
  }

  /**
   * Set the value of razonSocial
   * @param newVar the new value of razonSocial
   */
  public void setRazonSocial (String newVar) {
    razonSocial = newVar;
  }

  /**
   * Get the value of razonSocial
   * @return the value of razonSocial
   */
  public String getRazonSocial () {
    return razonSocial;
  }

  /**
   * Set the value of direccion
   * @param newVar the new value of direccion
   */
  public void setDireccion (String newVar) {
    direccion = newVar;
  }

  /**
   * Get the value of direccion
   * @return the value of direccion
   */
  public String getDireccion () {
    return direccion;
  }

  /**
   * Set the value of tlf
   * @param newVar the new value of tlf
   */
  public void setTlf (long int newVar) {
    tlf = newVar;
  }

  /**
   * Get the value of tlf
   * @return the value of tlf
   */
  public long int getTlf () {
    return tlf;
  }

  //
  // Other methods
  //

  /**
   * @param        cif
   * @param        rs
   * @param        dir
   * @param        tlf
   */
  public void asignar(String cif, String rs, String dir, long int tlf)
  {
  }


  /**
   * @return       Empresa
   */
  public Empresa obtener()
  {
  }


}
