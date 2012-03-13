class TopWin < NSWindowController          
  def init()
    initWithWindowNibName('TopWindow')
    window           
    window.setDelegate(self)
    self
  end  
   
  def windowDidLoad  
    if self.window.isVisible
      self.window.alphaValue = 0.0
      self.window.animator.setAlphaValue(1.0)
    end
  end

  def windowShouldClose(window)    
    self.window.animator.setAlphaValue(0.0)      
    frame = self.window.frame
    frame = [frame.origin.x, frame.origin.y - frame.size.height, frame.size.width, frame.size.height]
    self.window.setFrame(frame, display:false, animate:true)
    return false
  end
  
  def awakeFromNib     
    anim = CABasicAnimation.animation()
    anim.setDelegate(self)
    self.window.setAnimations(NSDictionary.dictionaryWithObject(anim, forKey:"alphaValue"))
  end

  def animationDidStop(animation, finished:flag)
    self.close if self.window.alphaValue == 0.00
  end
end