module shapes::examples::Test
import shapes::FigureServer;
import shapes::Figure;
import shapes::examples::Shortcuts;
import shapes::examples::Steden;
import shapes::Render;
import util::Math;


import util::Reflective;

import Prelude;
 
public void standard() {
      str dirN = "/tmp/rascal";
      loc dir = |file://<dirN>|;
      loc ok = dir+"ok.html";
      ftests(ok);
      }
 
 public str compare() {
     str dirN = "/tmp/rascal";
     loc dir = |file://<dirN>|;  
     str ok = readFile(dir+"ok.html"); 
     str check = toHtmlString(tests());
     return diff(ok, check);
     }
     
 Figure stack(Figure f) = vcat(align=centerMid, vgap=4, figs=[box(fig=text("\<pre\><figToString(f)>\</pre\>", size=<800, 60>, overflow="auto"), fillColor = "beige"), f]);
 
 Figure tests(  ) {
     return vcat(borderWidth=4, vgap=4, figs= mapper(
        [
        box(size=<100, 100>, fillColor ="green")
        ,box(fig=text("Hallo", fontSize=20, fontColor="darkred"), grow = 1.7, fillColor = "antiquewhite")
       ,box(fillColor="antiquewhite", lineWidth = 8, lineColor="blue", align = centerMid, grow  =1.0
              , fig = box( size=<200, 200>, fillColor = "gold", lineWidth = 8, lineColor = "red"))
       ,box(fig=box(size=<50, 50>,fillColor="yellow"),align= topLeft,grow = 1.5,fillColor = "antiquewhite", lineWidth = 2)
       ,box(fig=box(size=<50, 50>,fillColor="yellow"),align= centerMid,grow = 1.5,fillColor = "antiquewhite", lineWidth = 2)
       ,box(fig=box(size=<50, 50>,fillColor="yellow"),align= bottomRight,grow = 1.5,fillColor = "antiquewhite", lineWidth = 2)
        ,box(size=<75,75>, fig= box(shrink=0.666, fillColor = "yellow"), align = topLeft, fillColor= "antiquewhite", lineWidth=2)
        ,box(size=<75,75>, fig= box(shrink=0.666, fillColor = "yellow"), align = centerMid, fillColor= "antiquewhite", lineWidth=2)
        ,box(size=<75,75>, fig= box(shrink=0.666, fillColor = "yellow"), align = bottomRight, fillColor= "antiquewhite", lineWidth=2)
        ,
        hcat(figs=[box(size=<30, 30>, fillColor="antiquewhite"), box(size=<50, 50>, fillColor="yellow"), box(size=<70, 70>, fillColor=  "red")],align= topLeft, lineWidth =2)
        ,hcat(figs=[box(size=<30, 30>, fillColor="antiquewhite"), box(size=<50, 50>, fillColor="yellow"), box(size=<70, 70>, fillColor=  "red")],align= centerMid, lineWidth=2)
        ,hcat(figs=[box(size=<30, 30>, fillColor="antiquewhite"), box(size=<50, 50>, fillColor="yellow"), box(size=<70, 70>, fillColor=  "red")],align= bottomRight, lineWidth =2)
        ,hcat(lineWidth=1, width=200, height=70, figs= [box(shrink= 1.0, fillColor= "blue"), box(shrink= 0.5, fillColor= "yellow"), box(shrink=1.0, fillColor= "red")], align = bottomRight)
        ,vcat(width=200, height=70, figs= [box(shrink= 1.0, fillColor= "blue"), box(shrink= 0.5, fillColor= "yellow"), box(shrink=1.0, fillColor= "red")], align = bottomLeft)
        ,vcat(figs=[text("a",fontSize=14, fontColor="blue"), text("bb",fontSize=14, fontColor="blue"),text("ccc",fontSize=14, fontColor="blue")], align = topRight)
        ,grid(width=200, height=70, figArray= [[box(shrink= 0.5, fillColor="blue")], [box(shrink=0.3, fillColor="yellow"), box(shrink=0.5, fillColor="red")]], align=bottomLeft)
        ,grid(width=200, height=70, figArray= [[box(shrink= 0.5, fillColor="blue")], [box(shrink=0.3, fillColor="yellow"), box(shrink=0.5, fillColor="red")]], align=centerMid)
        ,graph(width=200, height=200, nodes=[<"a", box(fig=text("aap",fontSize=14, fontColor="blue"), grow=1.6, fillColor="beige")>
                                          , <"b", box(fig=text("noot",fontSize=14, fontColor="blue"), grow=1.6, fillColor="beige")>]
                                     ,edges=[edge("a","b")])
        ], stack)
        , resizable=true);
     } 
     
 public void ttests() = render(tests()); 
 
 
 public void ftests(loc l) = writeFile(l, toHtmlString(
   tests()
 ));
 
//Figure simple() =  box(lineWidth= 0, size=<50, 50>, fillColor = "green", tooltip=
//   box(lineWidth=1, fillColor="whitesmoke", fig=hcat(size=<150, 150>, lineWidth = 0, borderWidth = 0, hgap= 0, figs=[
//  box(lineWidth = 6, lineColor="magenta", fillColor= "antiquewhite")
// ,box(lineWidth = 6, size=<50, 50>, lineColor="magenta", fillColor= "whitesmoke")
//  ]))
 // )
 // ;
 
// Figure simple() =  hcat(figs=[box(size=<30, 30>, fillColor="blue"), box(size=<50, 50>, fillColor="yellow"), box(size=<70, 70>, fillColor=  "red")],align= topLeft);

Figure simple() {
  Figure f = circle(shrink=0.6, lineWidth=8, fillColor = "antiquewhite", align = centerRight, lineColor="green");
  return hcat(figs=[box(
   , fig=circle(shrink=0.8, fillColor ="antiquewhite", lineWidth = 20, lineColor="blue", align = centerRight
    , fig = ngon(n=5, shrink=0.8, lineWidth = 20,  lineColor = "red", fillColor="yellow", align = centerMid
    ,fig = circle(shrink=0.6, lineWidth=8, fillColor = "antiquewhite", lineColor="green"
   // ,event=on("click", box(fig=atXY(100, 100, 
  //  box(vgrow=2.0, lineWidth = 4, lineColor="grey", fig=text("\<pre\><f>\</pre\>"), fillColor = "whitesmoke"))/*, fillColor="none"*/))
 //,tooltip = box(size=<15, 15>, fillColor="green")
   )
)
)
)]);}

// Figure simple() = box(grow=1.5, fig=hcat(figs=[box(size=<50, 50>, fillColor="red")]));
//Figure simple() = 
//    box(fig=hcat(size=<600, 400>, hgap = 20, figs=[
//    ellipse(lineWidth=8, lineColor="red", fig = ellipse(lineColor="blue"))
//    , ellipse(lineWidth=8, lineColor="red", fig = ellipse(lineColor="blue"))
 //   ]))
//   ;

 
 public void tsimple() = render(simple(), size=<600, 600>);
 
 
 public void fsimple(loc l) = writeFile(l, toHtmlString(
   simple(), size=<600, 600>, resizable=true
 )); 
 
 public void psimple() = renderShow(simple(), 
    width = 400, height = 400, javaLoc=|file:///ufs/bertl/jdk1.8.0_77|);
 
 Figure eye()= ellipse(rx=60, ry = 30, lineColor="brown", align = centerMid, fillColor="teal", lineWidth = 6
                      , fig = circle(shrink=1.0, fillColor = "whitesmoke", lineWidth = 4, lineColor = "red"));
                      
 
                      
 //Figure eye()= box(size=<200, 200>, lineColor="brown", fillColor="yellow", lineWidth = 20
 //                     , fig = box(shrink=1.0, fillColor = "whitesmoke", lineWidth = 40, lineColor = "red"));
 
Figure face() = ellipse(grow= 1.2, fig=vcat( figs=[box(size=<50, 50>, lineWidth=0), hcat(figs=[eye(), eye()], hgap = 10)
                  ,polygon(size=<50, 150>, points=[<0, 0>, <1,0>, <0.5, 1>],scaleX=<<0,1>,<0, 50>>,scaleY=<<0,1>,<150, 0>>, fillColor="pink") 
                                     , box(size=<10, 10>, lineWidth= 0)
                                     ,overlay(figs=
                                     [ellipse(size=<200, 25>, fillColor="orange"), atXY(10, 10, box(size=<180, 4>, fillColor="brown", rounded=<2, 2>))])
                                  ,box(size=<50, 50>, lineWidth = 0)]
                       ,fillColor= "none"), fillColor="antiquewhite");
    
void tface() = render(face());                     
                      
 
public Figure idCircleShrink(num shrink) = circle(shrink= shrink, lineWidth = 4, lineColor = pickColor());

public Figure idEllipseShrink(num shrink) = ellipse(shrink= shrink, lineWidth = 4, lineColor = pickColor());

public Figure idBoxShrink(num shrink) = box(shrink= shrink, lineWidth = 10, lineColor = pickColor());

public Figure idNgonShrink(num shrink) = ngon(n=4, shrink= shrink, lineWidth = 4, lineColor = pickColor());

public Figure newCircle(str lc, Alignment align, Figure el) {
      return circle(r=-1, lineColor= lc, lineWidth = 4, 
           fillColor = "none", padding=<0,0,0,0>, align = align, 
      fig = el, shrink=0.9);
      }
      
public Figure newEllipse(str lc, Alignment align, Figure el) {
      return ellipse(lineColor= lc, lineWidth = 4, 
           fillColor = "none", padding=<0,0,0,0>, align = align, 
      fig = el, shrink=0.9);
      }
      
public Figure newBox(str lc, Alignment align, Figure el) {
      return box(lineColor= lc, lineWidth = 10, 
           fillColor = "none", padding=<0,0,0,0>, align = align, 
      fig = el, shrink=1.0);
      }
      
public Figure newNgon(str lc, Alignment align, Figure el) {
      return ngon(n=4, lineColor= lc, lineWidth = 4, 
           fillColor = "none", padding=<0,0,0,0>, align = align, 
      fig = el, shrink=0.9);
      }
      
public Figure bundle(int n, Alignment align) { resetColor(); return
      (idCircleShrink(0.9) |newCircle(e, align, 
      it)| e<-[pickColor()|int i<-[0..n]])
      ;}
      
public Figure bundle() = overlay(figs=[
               bundle(4, centerLeft), 
               bundle(4, centerRight),
               // bundle(4, centerMid),  
               bundle(4, topMid), 
               bundle(4, bottomMid)
              ])
               ;
      
void tbundle() = render(bundle(), size=<600, 600>);  

public void fbundle(loc l) = writeFile(l, toHtmlString(
   bundle(), resizable=true
 )); 
 
Figure base(int lineWidth, Alignment align, Figure fig = emptyFigure())  = box(lineWidth = 0, align = align, 
                 fig = box(shrink = 0.44, lineWidth = lineWidth, lineColor = pickColor(),
                           fig = fig)
                 );
                 
Figure base(int lineWidth, Figure fig = emptyFigure()){
                resetColor();
                return  overlay(figs = [
               base(lineWidth, topLeft, fig= fig)
             , base(lineWidth,topRight, fig = fig)
             , base(lineWidth,bottomLeft, fig = fig)
             , base(lineWidth,bottomRight, fig = fig)
             ]);}
              
Figure baseRec() { return base(4, fig = base(4, fig= base(4, fig= base(4)))
      //overlay(lineWidth = 0, figs=[
      //  box(lineWidth = 0, align=topLeft, fillColor="none", fig=circle(shrink=0.8, lineWidth = 1))
      //   ,
      //   box(lineWidth = 0, align=bottomRight, fillColor="none", fig=circle(shrink=0.8, lineWidth = 1))
      //])
     );
 }

void tbase() = render(baseRec(), size=<600, 600>);  

public void fbase(loc l) = writeFile(l, toHtmlString(
   baseRec()
 )); 
 
 Figure b(int w, int h) = box(grow=1.2, fig= box(size=<w, h>));
 
 Figure rec() = hcat(figs=[b(10, 40), b(20, 50), b(15, 45)
 // , box()
 ]);
 
 
 void trec() = render(rec(), size=<400, 400>);

public void frec(loc l) = writeFile(l, toHtmlString(
   rec()
 ));
 
 Figure place(str fill) = box(size=<25, 25>, fillColor = fill);

Figure tetris() = 
       grid( vgap=0, hgap= 0
       , 
       figArray=[
       [place("blue"), emptyFigure()]
      ,[place("blue"), emptyFigure()]
      ,[place("blue"), place("blue")]
       ]);
  
void ttetris() = render(tetris());   

loc location = |project://shapes/data/tutor.html|;  


Figure tut() =
      // box(fillColor="yellow", size=<50, 50>
      buttonInput("Push"
      // ,event = on("click", void(str e, str n , str v) {println("<e>");})
     , panel=atXY(60, 60, box(lineColor="black", lineWidth=2,  fig = text(readFile(location))))
     //, panel= 
    // atXY(60, 60, box(lineColor="black", size=<100, 100>, fillColor="antiquewhite", lineWidth=2, fig=box(size=<20, 20>, fillColor="red")))
     );

public void ttut() {render(tut(), cssFile = "tutor.css", size=<800, 800>);}

public void ftut(loc l) = writeFile(l, toHtmlString(
   tut(), cssFile = "tutor.css", size=<800, 800>
 ));
 
 public Figure elp() = ellipse(lineWidth = 10,   fig=box(size=<50, 100>, fillColor="yellow", lineWidth =6));
 
 public void telp() = render(elp());
 
 
Figure quest(str p, int x, int y) {
    bool isName(value v) =  str s:=v && /[0-9]/!:=s;
    bool isNotEmpty(value v) =  str s:=v && !isEmpty(s);
    bool isTel(value v) = str s:=v && size(s)==10 && s[0]=="0";
    bool lowConstraint(value v) = real d:=v && d>=100;
   
    list[Constraint] constraints = [<isName, "name contains digit">, <isNotEmpty,"enter name, please">];
       return hcat(figs=[
        makeFormAction(box(fig=text("aap"), grow=1.5,fillColor="yellow", visibility="visible"),
        // buttonInput("aap", width = 200),  
         [
         <p+"sexe", <["male", "female"], "">, "sexe", [<isNotEmpty, "choose sexe, please">]>
         , <p+"first", "Bert", "first name", constraints>
         ,<p+"last",  emptyStr, "last name",  constraints >
         ,<p+"telnumber", emptyStr, "tel. number", [<isTel, "is not a telephone number">]>,
        <p+"amount", emptyEuro, "amount", [<lowConstraint, "Start amount @ too low">]>
         ]
         ,event= on(void(str e, str n, str v){println("aap");})
         ,x=x, y = y, visibility = "hidden")
       ,
       box(size=<50, 50>,  fillColor = randomColor())
       ]);
    }

void tquest() = render(vcat(figs=[quest("a", 50, 50), quest("b", 300, 300)]));

public void fquest(loc l) = writeFile(l, toHtmlString(
   vcat(figs=[quest("a", 10, 10), quest("b",500, 500)])
 )); 
 
 
 Figure half()=hcat(height = 120, figs = [strInput(fillColor="yellow", nchars = 20)], fillColor="lightGrey");
 
 void thalf() = render(half());
 
 public void fhalf(loc l) = writeFile(l, toHtmlString(
    half()
 )); 
 
 
 
 Figure funLine() {
      int w = 400; 
      int h = 1600;
      int offset = 5;
      num hc = 0.5;
      list[int] prim = primes(30);
      tuple[int, int](num x, num y) c = lattice(w, h, 4, 25);
      int(num) cx = latticeX(w, 4);
      int(num) cy = latticeY(h, 25);
      map[int, tuple[int x, int y]] from = ();
      map[int, tuple[int x, int y]] to = ();
      
      int multiplicity(int d, int p) {
            int r=0;
            while (d%p==0) {
               r = r + 1;
               d = d/p;
               }
            return r;
            }
      
      Figure cell1(int d, int x , int y) {
      from[d] = <x, y>;
      return  atXY(c(x, y), box(fig=text("<d>"), size=c(0.25, hc), fillColor="yellow"));
      }
      
      Figure cell2(int d, int x , int y) {
      // println(d);
      to[d] = <x, y>;
      return  atXY(c(x, y), box(fig=text("<d>"), size=c(0.25, hc), fillColor="antiquewhite"));
      }
      
      Figure connect(int f, int t) {
         tuple[int , int] rv = <cx(to[t].x)-cx(from[f].x+0.25), cy(to[t].y+hc/2)-cy(from[f].y+hc/2)>;
         // println("<cx(from[f].y)> <cy(to[t].y)>");
         return overlay( figs=[
         shape([move(cx(from[f].x+0.25), cy(from[f].y+hc/2)), line(cx(to[t].x),  cy(to[t].y+hc/2))]
         ,yReverse = false
         // , endMarker = ngon(n=3, r=10, fillColor = "purple", lineWidth = 0)
         // , scaleX=<<0, w>, <0, w>>, scaleY=<<0, h>, <0, h>>
         )
         // ,circle(r=4, fillColor="firebrick", cx = cx(from[f].x+0.25)+0.2*rv[0], cy = cy(from[f].y+hc/2)+0.2*rv[1]
           ,atXY(cx(from[f].x+0.25)+toInt(0.2*rv[0])-2, cy(from[f].y+hc/2)+toInt(0.2*rv[1])-(rv[1]>0?2:6), circle(r=4, fillColor="firebrick"
           , tooltip=box(fig=text("<multiplicity(f, t)>"), fillColor="floralwhite", size=<50, 50>)
           )
          //, tooltip = 
          //box(fig=
          //    hcat(figs=[box(size=<50, 50>)], borderWidth=10, borderStyle="groove"),
          // fillColor="red")
         )
         ]);
         }
      Figures fs =  [cell1(i, 0, i-10) |int i<-[10..25]];
      Figures  ts = [cell2(prim[i], 3,  i+offset)|int i<-[0..5]];
      Figures cs = [*[connect(i, p)|p<-prim, i!=p, i%p==0]| int i<-[10..25]];
      return overlay(width=w, height = h, figs= fs +ts + cs
           );
      }
      
 void tfunLine() = render(funLine(), size=<800, 800>);
 
 void pfunLine() = renderShow(funLine(), javaLoc=|file:///ufs/bertl/jdk1.8.0_77|, size=<800, 800>);
 
 public void ffunLine(loc l) = writeFile(l, toHtmlString(
    funLine()
 )); 
 
Figure title() = box(size=<100, 100>, tooltip = atXY(0, 0, box(size=<20, 20>, fillColor="red")), fillColor="yellow");
 
void ttitle() = render(title()/*, javaLoc=|file:///ufs/bertl/jdk1.8.0_77|*/);

Figure hc() = hcat(size=<200, 100>, figs=[box(width=10, fillColor="yellow"), box(size=<100, 80>, fillColor="lightblue")]);

void thc() = render(hc()/*, javaLoc=|file:///ufs/bertl/jdk1.8.0_77|*/);

Figure ovl() = box(fig=overlay(size=<400, 400>, figs=[
          box(size=<50, 50>, fillColor="red", cellAlign=bottomLeft)
          ,box(size=<50, 50>, fillColor="yellow", cellAlign=topRight)
          ,box(size=<50, 50>, fillColor="green", cellAlign=centerMid)
          ]
          ));
          
 void tovl() = render(ovl()/*, javaLoc=|file:///ufs/bertl/jdk1.8.0_77|*/);
 
 
 Figure txt() = box(size=<50, 50>, tooltip=text("aap"));   
 
 void ttxt() = render(txt()/*, javaLoc=|file:///ufs/bertl/jdk1.8.0_77|*/); 
 
 void ftxt(loc l) = writeFile(l, toHtmlString(txt())); 
 
 Figure shadow(Figure fig) {
      Figure ov = fig;
      ov.fillColor = "grey"; ov.lineWidth = 0;
      return overlay(figs=[atXY(20, 20, ov), fig]);
      }
      
 void tshadow() = render(shadow(box(size=<100, 100>, fillColor="red")));
 
 Figure at() {
     list[Figure] fs= [atXY(arbInt(800), arbInt(800), rotateDeg(30, svgText(stringChar(arbInt(26)+97), fontStyle="normal" , fontFamily="serif"
     , fontColor=randomColor(), fontLineColor=randomColor(), fontLineWidth=2.0, fontSize=40+arbInt(60))))|int i<-[0..200]];
     return overlay(figs=fs);
     }
 
 void tat() = render(at());
 
void ftat(loc l) = writeFile(l, toHtmlString(at())); 

Figure span() = grid(/*borderWidth=1, borderStyle="solid", align=centerLeft,*/ figArray=[
         [text("__"), text("__"),text("__"), text("__"), text("__"), text("__"), text("__")]
         ,
         [
         text("", colspan=2),text("0", colspan=2),text("1", colspan=2)], 
         [
         text("", colspan=2),text("3", colspan=2),text("4", colspan=2),text("&nbsp;&nbsp;+", rowspan=2)]    
        ,[
          text("2", borderTopStyle="solid", borderWidth=1, borderTopColor="blue", colspan= 2)
        , text("5", borderTopStyle="solid", borderWidth=1, borderTopColor="blue", colspan= 2),
          text("6", borderTopStyle="solid", borderWidth=1, borderTopColor="blue", colspan= 2)
        ] 
         ,[text("", colspan=1), text("\<", colspan=2),  text("\<", colspan=2), text("", colspan=1)]     
        ]);

void fspan(loc l) = writeFile(l, toHtmlString(span())); 

void tspan()=render(span());

list[int] ndigits(int x)  {
     return while(x>0) {
          append(x%10);
          x = x/10;
          }
     }
     
list[list[int]] mirror(list[list[int]] m) {
   int nr  =size(m);
   int nc = size(m[0]);
   list[list[int]] r = [[]|_<-[0..nc]];
    for (int i<-[0..nr]) 
       for (int j<-[0..nc]) 
           r[j]+=[m[i][j]];         
    return r;
    }
     
list[tuple[int, int, int]] add(list[list[int]] x) {
     list[list[int]] y = mirror(x);
     int i = 0;
     int shift = 0;
     list[tuple[int, int, int]] r =[];
     for (d<-y) {
         int s = sum(d);
         int v = (s+shift)%10;
         shift = s/10;
         r+=<v, shift, i>;
         i+=1;
         }
     return r;
     }

Figure schoolSum(list[int] ds) {
      list[list[int]] xs =[ndigits(d)|d<-ds];
      int N = max([size(x)|x<-xs]);
      xs = [x+[0|_<-[size(x)..N+1]]|x<-xs];
      list[tuple[int, int, int]] s = add(xs);
      int last = size([d|d<-s, d[1]!=0])-1;
      // println(s);
      return grid(
          figArray=[
              [text("&nbsp;&nbsp;")|_<-xs+xs]
              ]
              +
              [
               [text("<d>", colspan=2)|d<-reverse(x)]|x<-xs
              ]
              +
              [
                [text("", colspan=1)]+
                     [text("<(d[2]==e[2]&& e[1]>0)?"\<<e[1]>":"">", colspan=2)|e<-tail(reverse(s))]
                      +(d[2]==last?[text("", rowspan=2), text("&nbsp;&nbsp;+", rowspan=2)]:[])
                     |d<-head(s, size(s)-1), d[1]!=0
              ]          
              +     
              [
              [text("<d[0]>", borderTopStyle="solid", borderWidth=1, borderTopColor="blue", colspan=2)|d<-reverse(s)]
              ]
              
          );
      }

 void tschoolSum(list[int] s)=render(schoolSum(s));  
 
 Figures txts (list[int] vs) = [box(fig=text("<v>"), size=<30, 30>)|v<-vs];
 
 
 Figure createDefaultShape(str id, int n) {
       Figure to1 = ngon(n=3, r=6, angle =180, fillColor="black");
       Figure to2 = ngon(n=3, r=6, fillColor="black");
       return shape([], scaleX=<<0, 1>, <0, n*30>>
             ,scaleY=<<0,1>,<0, 40>>,colspan=n, id = id,
              height= 50,  width = n*30, startMarker=to1, endMarker=to2, shapeCurved= true
              );
      }
 
 str arrow(Figure f, int n, bool shapeCurved) {
      f.shapeCurved = shapeCurved;
      return getVerticeString(f, shapeCurved?
         [move(1.0/(n*2),0.2), line((1.0/(n*2)+0.5)/2, 0.4), line(0.5, 0.5),line(1.0-1.0/(n*2), 0.2)]
         :
         [
         move(1.0/(n*2),0.2), line(1.0/(n*2), 0.7), line(1.0-1.0/(n*2), 0.7), line(1.0-1.0/(n*2), 0.2)
         ]
         );
      }
 
 Figures swap(Figure f, int pos, int n) {     
       Figures r = [text("")|_<-[0..pos]]+[f];
       return r;
       }
 
 Figure bubbleSort(list[int] a) {
       map[str, tuple[str, str]] update=();
       bool swapped = false;
       list[list[Figure]] r = [txts(a)]; 
       int k = 0;   
       do {
          swapped = false;
          int n = size(a);
          for (int i <-[1..n]) {
              if (a[i-1]>a[i]) {
                  int x = a[i];
                  a[i] = a[i-1];
                  a[i-1] = x;
                  str id = "a<k>";
                  k = k+1;
                  Figure f = createDefaultShape(id, 2);
                  r+=[swap(f ,i-1, 2)];
                  update+=(id:<arrow(f, 2, true), arrow(f, 2, false)>);
                  swapped = true;
                  r+=[txts(a)];
                  }
              }
          } 
       while (swapped);
       return grid(figArray=r, event= on("load", void(str e, str n, str v) {
                 println(update);
                 for (x<-update) updateArrow(x, update[x][1]);
                 }));
       }
       
 void updateArrow(str n, str v) {
     attr(n, d = v);
     // println(f.id);
     }
       
       
 Figure combSort(list[int] a) {
       map[str, tuple[str, str]] update=();
       int gap = size(a);
       num shrink = 1.3;   
       bool sorted = false;
       list[list[Figure]] r = [txts(a)];   
       int k  =0; 
       do {
          gap = floor(gap/shrink);
          if (gap>1)
               sorted = false;
          else {
            gap=1;
            sorted = true;
            }
          int n = size(a);
          for (int i <-[0..n-gap]) {
              if (a[i]>a[i+gap]) {
                  int x = a[i+gap];
                  a[i+gap] = a[i];
                  a[i] = x;
                  str id = "a<k>";
                  k=k+1;
                  Figure f = createDefaultShape(id, gap+1);
                  r+=[swap(f, i, gap+1)];
                  update+=(id:<arrow(f, gap+1, true), arrow(f, gap+1, false)>);         
                  sorted = false;
                  r+=[txts(a)];
                  }
              }
          } 
       while (!sorted);
       return vcat(figs=[
              grid(figArray=r, event= on("load", void(str e, str n, str v) {
                   if (map[str, bool] choice2checked:=  property("checkbox").\value) {
                      for (x<-update) updateArrow(x, update[x][choice2checked["0"]
                      ?0:1]);
                      }
                   })       
                  )
                  ,
                  checkboxInput(id="checkbox", choices = ["0"], \value = (), labels=("0":"curved")
                  , event = on("click", void(str e, str n, str v) {
                        if (v=="-1")  for (x<-update) updateArrow(x, update[x][1]);
                                 else for (x<-update) updateArrow(x, update[x][0]);
                  }
                  ))
                  ])
                  ;
       }
 
 
 Figure srt(list[int] a) = combSort(a);
      
 void tsrt(list[int] a) = render(srt(a )); 
 
 void fsrt(loc l) = writeFile(l, toHtmlString(srt([5,3,1]))); 
 
 tuple[Figure, int] _gcd(int x, int y) {
     int d =  x/y;
     int r =  x%y;
     return <grid(figArray= [
             [text(""), text("<d>"
               ,borderBottomStyle="solid", borderBottomWidth=1
               )
               ]
            ,[text("<y>", padding=<0, 0, 2, 0>), text("<x>"
                  // ,borderTopStyle="solid", borderTopWidth=1
                  ,borderLeftStyle="solid", borderLeftWidth=1, padding = <2, 0, 2, 0>
                 )]
            ,[text(""), text("<d*y>", borderBottomStyle="solid", borderBottomWidth=1)]
            ,[text(""), text("<r>")]
          ], vgap = 2
          ), r>;
     }
     
 Figure move() {
    num p = 0.7;
    Figure to2 = ngon(n=3, r=8, fillColor="black");
    Vertices vs = [move(0.2, p), line(p, 0.3)];
    return shape(vs, size=<40, 60>, scaleX=<<0, 1>, <0, 40>>,scaleY=<<0,1>,<0, 60>>
    , cellAlign=bottomMid, endMarker = to2);
    }
     
 Figure gcd(int x, int y) {
    tuple[Figure, int] g =_gcd(x, y);
    list[tuple[Figure, int]] xs = [g];
    int r = g[1];
    while (r>0) {
        g = _gcd(y, r);
        y = r;
        r = g[1];
        xs+=[g];
        }
    // println(xs);
    Figures fs = [z[0]|z<-xs];
    fs = intercalate(move(), fs);
    return grid(figArray=[fs]);
    }
 
 void tgcd(int x, int y) = render(gcd(x, y));
 
 Figure pck1() = pack(
    [circle(r=5*i, fillColor=pickColor())|i<-[2..10]]
    );
 
 Figure pck(bool rec) {
      resetColor();
      return pack(
      [
         *[box(size=<i*10*(j%2+1), ((j+1)%2+1)*i*10>, fillColor=pickColor())|j<-[1..40]] |i<-[2..6]
      ]+[pck1()]  
     );
    }
    
 
 void tpck() = render(pck(true));
 
 void fpck(loc l) = writeFile(l, toHtmlString(pck(true))); 
