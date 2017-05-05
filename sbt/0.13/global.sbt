import org.ensime.EnsimeCoursierKeys._
import org.ensime.EnsimeKeys._

ensimeServerVersion in ThisBuild := "2.0.0-SNAPSHOT"
ensimeJavaFlags in ThisBuild := Seq("-Xss2m", "-Xmx4g", "-XX:MaxMetaspaceSize=512m", "-XX:+UseG1GC")
