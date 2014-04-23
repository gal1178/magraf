class Graphic < ActiveRecord::Base
  #after_save :svg1
  attr_accessible :filename
  belongs_to :examination
  def svg1(xs,ys,zs,name,examination)
    exam=Examination.find(examination)
    exam.graphic.create(:filename =>"#{name}.png")
    Gnuplot.open do |gp|
      Gnuplot::SPlot.new( gp ) do |plot|
        plot.terminal "png"
        plot.key"off"
        plot.samples 200
        plot.isosamples "100,50"
        plot.hidden3d "defaults"
        plot.xtics "axis nomirror"
        plot.ytics "axis nomirror"
        #plot.view "0,0"
        plot.output File.join(Rails.root,'graphics',name)
        plot.data << Gnuplot::DataSet.new([xs,ys,zs]) { |ds|
          ds.linewidth = 2
          ds.with="points"
          }
      end
    end
  end
end
