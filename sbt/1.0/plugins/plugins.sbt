
libraryDependencies ++= {
  val sbtV = (sbtBinaryVersion in pluginCrossBuild).value
  val scalaV = (scalaBinaryVersion in update).value
  if(sbtVersion.value.split("\\.")(1).toInt < 3) {
    println("Adding coursier plugin for sbt < 1.3.0")
    Seq(Defaults.sbtPluginExtra("io.get-coursier" % "sbt-coursier" % "1.1.0-M14", sbtV, scalaV))
  } else {
    println("Skip adding coursier for sbt >= 1.3.0")
    Seq.empty
  }
}
