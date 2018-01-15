import org.ensime.EnsimeCoursierKeys._
import org.ensime.EnsimeKeys._

//ensimeRepositoryUrls += "https://oss.sonatype.org/content/repositories/snapshots/"
//ensimeServerVersion in ThisBuild := "3.0.0-SNAPSHOT"
//ensimeProjectServerVersion in ThisBuild := "3.0.0-SNAPSHOT"
//ensimeServerJars in ThisBuild := Seq(file("/home/phaun/development/projects/ensime-server/target/scala-2.12/ensime_2.12-3.0.0-SNAPSHOT-assembly.jar"))

ensimeJavaFlags in ThisBuild := Seq("-Xss2m", "-Xmx4g", "-XX:MaxMetaspaceSize=512m", "-XX:+UseG1GC")
