Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3BD554E71
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Jun 2022 17:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358884AbiFVPEO (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Jun 2022 11:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358962AbiFVPEC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Jun 2022 11:04:02 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A55A3EB8B
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jun 2022 08:03:54 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g186so16353938pgc.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jun 2022 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=Jt/qXO7TwQJF3EWuk5p4azKGOCxq/Rzk3KoLqC6Pwff+0tHhs8als9639cidnzFde4
         ry7ero38QELHA22RBkZWtE0xNRPiiPEWIvKtPd0fZpNhUDrKHRyETW5WgRrbPPmi6/vT
         vJpxoQNLrGfsMgIfV+PXszjD1nMaBRUe0Gxx0eYZw7YGtSc5pfRkGeshne5cjr5BaKxu
         3INPcNuWqxw7/0puGY6UuhzUSAv6SoxD7Bz3CVHuDQWru55+lIHO02gOv78FJXnTYNjB
         rbtWgbiyhkE21LXWR11Bk6fRJOPFFcU92J8XbdNavb7vvb9W0t8MjYRzeI2ufnWOCsiS
         AGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=n40paWue/SBoOGK+U5zIpvonUNXF5tpTgILk0230cxG8vHS4da0VMPbnMK3ufmCspd
         fI/t2YMQWNNeuLni9LNV77wuUxEafdCX/Eu2jbUI5hr1SzXwEURN2Ust7JnD8TJO366j
         2P8R4osZ2VIBzNQXN+FVNX55we2MQVXB9sJpNsmVFO0VZe/xMfSzqWw+vfokNmjcfxgk
         nMY+/HhRbtMiqYenIxB3qsW1cLv7HfJArVM4SskNVfQ8G7xR0RD8U3uuZHiVF3JXgouc
         7y0HF04rpQs2pjsKz3kp8XTQBYq5cfvTbs2kFkjtFYIr+69fnotrm0yt2l8pb0wre/84
         S/+Q==
X-Gm-Message-State: AJIora+Ewa9bnVORsojSX7LHk/Zf7rTjLHP4UKKKAwpBSsyI7YgYFv4W
        CuB+MQXoYeiEk4ReykzqiuCHqWLpvuIrVHzXA8s=
X-Google-Smtp-Source: AGRyM1uVFGSnpr+dTCH2B3yi91+xpZWxlNuq532hGAWMLDkFZu1Qrq3wwA6KogrJ63y1ppaQwcWp21NviyeWeo5Xswg=
X-Received: by 2002:a63:af1c:0:b0:40c:f9fb:deca with SMTP id
 w28-20020a63af1c000000b0040cf9fbdecamr3305128pge.479.1655910232628; Wed, 22
 Jun 2022 08:03:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:03:51 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:03:51 +0100
Message-ID: <CAFkto5szY9scoLwccBhUx92cgUVnT2cx2c=WmxiOTkm7N_y9gg@mail.gmail.com>
Subject: Service Needed.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
