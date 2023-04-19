

/**
 * Class Cliente
 */
public class Cliente {

  //
  // Fields
  //

  private int codCliente;
  private String nombre;
  private String fechanacimiento;
  private long int tlf;
  
  //
  // Constructors
  //
  public Cliente () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of codCliente
   * @param newVar the new value of codCliente
   */
  public void setCodCliente (int newVar) {
    codCliente = newVar;
  }

  /**
   * Get the value of codCliente
   * @return the value of codCliente
   */
  public int getCodCliente () {
    return codCliente;
  }

  /**
   * Set the value of nombre
   * @param newVar the new value of nombre
   */
  public void setNombre (String newVar) {
    nombre = newVar;
  }

  /**
   * Get the value of nombre
   * @return the value of nombre
   */
  public String getNombre () {
    return nombre;
  }

  /**
   * Set the value of fechanacimiento
   * @param newVar the new value of fechanacimiento
   */
  public void setFechanacimiento (String newVar) {
    fechanacimiento = newVar;
  }

  /**
   * Get the value of fechanacimiento
   * @return the value of fechanacimiento
   */
  public String getFechanacimiento () {
    return fechanacimiento;
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
   * @param        codCliente
   * @param        nombre
   * @param        fechaNacimiento
   * @param        tlf
   */
  public void asignar(int codCliente, String nombre, String fechaNacimiento, long int tlf)
  {
  }


  /**
   * @return       Cliente
   */
  public Cliente obtener()
  {
  }


}
