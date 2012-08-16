library("grid")

vp <- vpTree(viewport(layout=grid.layout(3,3,
                                         widths = c(19,19,2),
                                         heights = c(2,19,19)), name="layout"),
             children =
             vpList(viewport(layout.pos.col = 1,
                             layout.pos.row = 2, name="tl"),
                    viewport(layout.pos.col = 2,
                             layout.pos.row = 3, name="br"),
                    viewport(layout.pos.col = 1,
                             layout.pos.row = 3, name="bl"),
                    viewport(layout.pos.col = 2,
                             layout.pos.row = 2, name="tr")
                    ))

icon.all <-
    gList(rectGrob(0, 1, width=0.95, height=0.05, hjust=0, vjust=1, gp=gpar(fill="grey60", col=NA)),
          rectGrob(0.95, 0.95, width=0.05, height=0.95, hjust=0, vjust=1, gp=gpar(fill="grey60", col=NA)),
          gTree(childrenvp = vp,
                children = gList(gTree(vp="layout",
                                       children = gList(
                                                  pointsGrob(x = c(1,1,2,3,3,3,4,4,5,5,5,5,6,7,7,7,8,8,9)/10,
                                                             y = c(1,2,1,1,2,3,1,2,1,2,3,4,1,1,2,3,1,2,1)/10,
                                                             pch = 19, size = unit(.1, "npc"),
                                                             gp = gpar(col = "black", cex = 0.5), default.units = "npc",
                                                             vp="bl"),
                                                  pointsGrob(x=seq(0.1, 0.9, length=6), y=seq(0.9, 0.1, length=6),
                                                             pch=19, gp=gpar(col="black", cex=0.5), default.units="npc",
                                                             size = unit(.1, "npc"),
                                                             vp="tr"),
                                                  rectGrob(c(0.1, 0.3, 0.5, 0.7, 0.9), width=0.21,
                                                           gp=gpar(fill=gray(seq(0, 1, length=5)), col=NA),
                                                           vp="tl"),
                                                  circleGrob(c(0.15, 0.3, 0.5, 0.75), c(0.15, 0.3, 0.5, 0.75),
                                                             r=(c(0.1, 0.2, 0.3, 0.4)/2.5), gp=gpar(fill="grey50", col=NA),
                                                             vp="br")
                                                  ))
                                 )),
          segmentsGrob(c(0, 0.475), c(0.475, 0), c(1, 0.475), c(0.475, 1))
          )
grid.newpage()
grid.draw(icon.all)

pdf("ggicon.pdf")
grid.draw(icon.all)
dev.off()

svg("ggicon.svg")
grid.draw(icon.all)
dev.off()

png("ggicon64.png", width=64, height=64)
grid.draw(icon.all)
dev.off()

png("ggicon16.png", width=16, height=16)
grid.draw(icon.all)
dev.off()
