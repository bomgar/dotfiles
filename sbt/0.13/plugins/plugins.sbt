if (sys.props("java.version").startsWith("1.6"))
  addSbtPlugin("org.ensime" % "sbt-ensime" % "1.0.0")
else
  addSbtPlugin("org.ensime" % "sbt-ensime" % "1.9.1")


addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.0-M14")
