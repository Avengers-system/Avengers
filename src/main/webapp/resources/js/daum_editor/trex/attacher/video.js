/**
 * @videooverview 
 * Image 업로드 관련 Source
 * Trex.Tool.Image - UI,
 * Trex.Attacher.Image,
 * Trex.Attachment.Image,
 * default configuration를 포함하고 있다.
 */
TrexConfig.addTool(
	"video",
	{
		disabledonmobile: _TRUE,
		wysiwygonly: _TRUE,
		sync: _FALSE,
		status: _FALSE
	}
);

TrexMessage.addMsg({
	'@video.title': "영상"
});

Trex.Tool.Image = Trex.Class.create({
	$const: {
		__Identity: 'video'
	},
	$extend: Trex.Tool,
	oninitialized: function() {
		var _editor = this.editor;
		this.weave.bind(this)(
			new Trex.Button(this.buttonCfg), 
			_NULL,
			function() {
				_editor.getSidebar().getAttacher("image").execute();
			}
		);
	}
});

TrexConfig.addAttacher(
	"video",
	{	
		multiple: _TRUE,
		multipleuse: _FALSE,
		checksize: _TRUE,
		boxonly: _FALSE,
		wysiwygonly: _TRUE,
		objattr: {},
		features: { left:250, top:65, width:797, height:644 },
		popPageUrl: "#host#path/pages/trex/video.jsp"
	},
	function(root){
		var _config = TrexConfig.getAttacher("video", root);
		_config.popPageUrl = TrexConfig.getUrl(_config.popPageUrl);
		_config.features = TrexConfig.getPopFeatures(_config.features);
	}
);

/**
 * Trex.Attacher.video
 * @class
 * @extends Trex.Attacher
 */
Trex.Attacher.video = Trex.Class.create({
	$const: {
		__Identity: 'video'
	},
	$extend: Trex.Attacher,
	name: 'video',
	title: TXMSG("@video.title"),
	canModified: _FALSE,
	canResized: _TRUE,
    matchRegexStartTag: /<(\w+)/,// 첨부시에 dispHtml을 기준으로 속성 및 스타일을 적용 할 태그를 찾을 때 사용
	oninitialized: function() {
		
	},
	getKey: function(data) {
		return data.imageurl;
	},
	getDataForEntry: function(data) {
		data.imageurl = this.encodeSpaceInUrl(data.imageurl);
		data.originalurl = this.encodeSpaceInUrl(data.originalurl);
		data.attachurl = this.encodeSpaceInUrl(data.attachurl);
		data.thumburl = data.thumburl || data.imageurl.replace(/\/image\//gm, '/P150x100/');
		  
		if(!data.dispElId) {
			data.dispElId = Trex.Util.getDispElId();
		}
		var _seq = ((data.tmpSeq)? this.entryBox.syncSeq(data.tmpSeq): this.entryBox.newSeq());
		var _data = Object.extend({ 
			dataSeq: _seq
		}, data); //NOTE: Cuz IE
		return _data;
	},
	createEntry: function(data, type) {
		return this.createAttachment(data, type);
 	},
	encodeSpaceInUrl: function(url){
		if ( !url ) {
			return ;
		}
		
		return url.replace(/ /g, "%20");	
	},
	execAttach: function(data, type) {
		var _entry = this.createEntry(this.getDataForEntry(data), type);
		_entry.execRegister();
	},
	execReload: function(data, content, type) {
		var _entry = this.createEntry(this.getDataForEntry(data, content), type);
		_entry.execReload();
	}
});

/**
 * Trex.Attachment.video 
 * 
 *  @example
 *  	data = {
 *			thumburl: "string",
 *			imageurl: "string",
 *			filename: "string",
 *			filesize: number
 *		}
 * @class
 * @extends Trex.Attachment
 */
Trex.Attachment.video = Trex.Class.create({
	$const: {
		__Identity: 'video'
	},
	$extend: Trex.Attachment,
	getFieldAttr: function(data) {
		return {
			name: 'tx_attach_video', 
			value: [data.thumburl, data.imageurl, data.originalurl, data.exifurl, data.filename, data.filesize].join('|')
		};
	},
	getBoxAttr: function(data) {
		var _rectangle = data.width ? data.width + "x" + data.height + " / " : ""; 
		return {
			name: data.filename + " (" +  _rectangle + data.filesize.toByteUnit() + ")",
			image: data.thumburl
		};
	},
	getObjectAttr: function(data) {
		var _objattr = Object.extend({}, this.actor.config.objattr);
		if(data.width) {
			if(!_objattr.width || _objattr.width > data.width) {
				_objattr.width = data.width;
			}
		} else {
			_objattr.width = _NULL;
		}
		if(data.height) {
			if(!_objattr.height || _objattr.height > data.height) {
				_objattr.height = data.height;
			}
		} else {
			_objattr.height = _NULL;
		}
		return _objattr;
	},
	/**
	 * object의 style 값을 가져온다.
	 * @function
	 */
	getObjectStyle: function(data) {
		var _objstyle = {};
		if(this.actor.config.objstyle) {
			_objstyle = Object.extend(_objstyle, this.actor.config.objstyle);
		}
		if(data.imagealign) {
			var _objectStyle = {
				"L": Trex.Tool.AlignLeft,
				"C": Trex.Tool.AlignCenter,
				"FL": Trex.Tool.AlignRight,
				"FR": Trex.Tool.AlignFull
			}[data.imagealign];
			if (_objectStyle && _objectStyle.__ImageModeProps && _objectStyle.__ImageModeProps['image']) {
				_objstyle = Object.extend(_objstyle, _objectStyle.__ImageModeProps['image']['style']);
			}
		}
		return _objstyle;
	},
	/**
	 * object를 감싸고 있는 paragraph tag 의 style 값을 가져온다.
	 * @function
	 */
	getParaStyle: function(data) {
		var _parastyle = Object.extend({}, this.actor.config.parastyle || this.actor.config.defaultstyle);
		if(data.imagealign) {
			var _objectStyle = {
				"L": Trex.Tool.AlignLeft,
				"C": Trex.Tool.AlignCenter,
				"FL": Trex.Tool.AlignRight,
				"FR": Trex.Tool.AlignFull
			}[data.imagealign];
			if (_objectStyle && _objectStyle.__ImageModeProps && _objectStyle.__ImageModeProps['paragraph']) {
				_parastyle = Object.extend(_parastyle, _objectStyle.__ImageModeProps['paragraph']['style']);
			}
		}
		return _parastyle;
	},
	getSaveHtml: function(data) {
		return "<img src=\"" + data.imageurl + "\" class=\"txc-image\"/>";
	},
	getDispHtml: function(data) {
		return "<img id=\"" + data.dispElId + "\" src=\"" + data.imageurl + "\" class=\"txc-image\"/>";
	},
	getDispText: function(data) {
		return "<img src=\"" + data.imageurl + "\" class=\"txc-image\"/>";
	},
	getRegLoad: function(data) {
		return new RegExp("<(?:img|IMG)[^>]*src=\"?" + data.imageurl.getRegExp() + "\"?[^>]*\/?>", "gim");
	},
	getRegHtml: function(data) {
		return new RegExp("<(?:img|IMG)[^>]*src=\"?" + data.imageurl.getRegExp() + "\"?[^>]*\/?>", "gim");
	}, 
	getRegText: function(data) {
		return new RegExp("<(?:img|IMG)[^>]*src=\"?" + data.imageurl.getRegExp() + "\"?[^>]*\/?>", "gim");
	}
});
